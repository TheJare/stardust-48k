
#include <cstdio>
#include <vector>
#include <stdarg.h>

#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

using namespace std;

using bytes = vector<uint8_t>;

void error(char const *msg, ...) {
    va_list vl;
    va_start(vl, msg);
    printf("Error:\n  ");
    vprintf(msg, vl);
    va_end(vl);
    exit(1);
}

bytes readFile(char const *filename) {
    auto f = fopen(filename, "rb");
    if (f == nullptr) {
        error("File not found: %s", filename);
    }
    fseek(f, 0, SEEK_END);
    auto size = ftell(f);
    fseek(f, 0, SEEK_SET);
    auto v = bytes(size);
    fread(v.data(), size, 1, f);
    fclose(f);
    return v;
}

struct image {
    bytes pix;
    int w;
    int h;
    int chans;

    image(int w_, int h_, int chans_): w(w_), h(h_), chans(chans_), pix(w_*h_*chans_) {}

    bool save(char const *filename) {
        if (0 != stbi_write_png(filename, w, h, chans, pix.data(), w*chans)) {
            return true;
        }
        error("Writing file %s", filename);
        return false;
    }
};

void dumpSprite(image &img, bytes const &bin, int srcoff, int srcw, int srch, int srcstride, int destx, int desty, uint32_t setMask = 0xFFFFFFFFU, uint32_t bgMask = 0) {
    for (auto i = 0; i < srch; ++i) {
        for (auto j = 0; j < srcw; ++j) {
            auto src = srcoff + i*srcstride + j/8;
            auto srcbit = 0x80 >> (j & 7);
            auto v = bin[src] & srcbit;
            auto *d = &img.pix[(destx + j + (desty + i)*img.w)*img.chans];
            auto m = v? setMask : 0;
            d[0] = uint8_t((bgMask >> 24)&d[0] | (m >> 24));
            d[1] = uint8_t(((bgMask >> 16) & 0xFF)&d[1] | ((m >> 16) & 0xFF));
            d[2] = uint8_t(((bgMask >> 8) & 0xFF)&d[2] | ((m >> 8) & 0xFF));
            d[3] = uint8_t(((bgMask) & 0xFF)&d[3] | ((m) & 0xFF));
        }
    }
}

void dumpSprites(image &img, bytes const &bin, int srcoff, int n, int srcw, int srch, int srcstride, int destx, int desty, uint32_t setMask = 0xFFFFFFFFU, uint32_t bgMask = 0) {
    for (int i = 0; i < n; ++i) {
        int x = destx + (i % (img.w/srcw))*srcw;
        int y = desty + (i / (img.w/srcw))*srch;

        dumpSprite(img, bin, srcoff + (srch*i*srcstride), srcw, srch, srcstride, x, y, setMask, bgMask);
    }
}

void dumpSprites(char const *filename, int w, int h, bytes const &bin, int srcoff, int n, int srcw, int srch, int srcstride, int destx, int desty, uint32_t setMask = 0xFFFFFFFFU, uint32_t bgMask = 0) {
    image img(w, h, 4);
    dumpSprites(img, bin, srcoff, n, srcw, srch, srcstride, destx, desty, setMask, bgMask);
    img.save(filename);
}

void dumpMaskSprites(char const *filename, int w, int h, bytes const &bin, int srcoff, int n, int srcw, int srch, int srcstride, int destx, int desty, uint32_t setMask = 0xFFFFFFFFU, uint32_t bgMask = 0) {
    image img(w, h, 4);
    dumpSprites(img, bin, srcoff, n, srcw, srch, srcstride, destx, desty, 0xFF00FFFFU, bgMask);
    dumpSprites(img, bin, srcoff+srcw/8, n, srcw, srch, srcstride, destx, desty, 0xFFFFFFFFU, 0xFFFFFFFFU);
    img.save(filename);
}

int main(int argc, char const *argv[]) {
    if (argc < 2) {
        error("No file given");
    }

    auto bin = readFile(argv[1]);

    dumpSprites("charset.png", 128, 64, bin, 0x00006000-0x4000, 59, 8, 8, 1, 0, 0);
    dumpSprites("sentinels.png", 128, 128, bin, 0x000069A8-0x4000, 15, 24, 24, 3, 0, 0);
    dumpSprites("level_tiles.png", 512, 256, bin, 0x00006DE0-0x4000, 111, 32, 32, 4, 0, 0);
    dumpSprites("sprite_masks.png", 256, 256, bin, 0x0000A560-0x4000, 83, 16, 16, 4, 0, 0);
    dumpSprites("sprites_bits.png", 256, 256, bin, 0x0000A560-0x4000+2, 83, 16, 16, 4, 0, 0);
    dumpMaskSprites("sprites.png", 256, 256, bin, 0x0000A560-0x4000, 83, 16, 16, 4, 0, 0);
}
