# Stardust rebuilt

This little project tries to reverse engineer a reasonable version of the
source code for our game Stardust, to celebrate the 30 years since its
original release for 8-bit computers back in 1987.

We have focused on the Sinclair ZX Spectrum version of the game, which was
the main version we created back then. We originally ported it to the
Amstrad CPC, while other people did the MSX, C-64 and eventual PC versions.
But doing this project for the Spectrum is work enough. The intro and the
entire on-foot second stage of the game also fell outside the scope of this
effort.

The authors wish to dedicate this project to the memory of our beloved mentor
and producer Javier Cano, and to Alfonso Azpiri, the unforgettable artist who
created the cover for Stardust and many other games. Rest in peace.

Also thank to Roberto Carlos Fernandez, who many years ago made me promise
I'd give him a printed copy of the sources. That copy is buried in some box
in storage somewhere, and we'd rather do this than go search for it.

The authors of the original game have all given permission to make this
project public.

Jump straight to the current version of the game's source code [here](s1.asm).

## How was this done?

We downloaded a few Spectrum emulators since we didn't know which were best
and what they could do. We settled on Fuse and its toolset. Next was an image
of the tape from the original Spanish release. We ran the tape in the emulator
and waited for the game to load. It does a little intro and credits sequence,
which we didn't bother to capture at first. Once the game was in the main menu,
we grabbed a snapshot in z80 format, and worked from there.

Initial steps:

- Capture a profile of the game running, and generate a map file that will
contain the code sections that have been executed. This should include most
code, and hopefully lead to an almost-ready-to-assemble source file.
- Use SkoolKit with the snapshot and the map file, to create a control file
that contains information on the snapshot memory map: code and data sections,
mainly.

Now we iterate on the next steps as many times as needed (a lot) to improve
the control file and reach a very complete assembly file.

- Generate an assembly source file from the snapshot and the control file
- Study the assembly code and iterate on the control file to add more
information: labels, comments, better delineation of data sections, etc.

At any point, with the assembly file in a good state, we can generate an executable.

- Assemble the source code into a binary, and convert it to snapshot format,
with a valid stack pointer and entry point. Note the original snapshot was
captured in the middle of the game running, but we wanted a reasonable
entry point that sets everything up.
- Tweak the snapshot to set the border color and disable interrupts.
- At this point we have a valid snapshot that can be loaded and runs fine.

We work on Windows machines, so we have documented the commands to run the
above steps inside the file [b.cmd](b.cmd). Adapt the paths in that file to
your own installation if you want to use run it yourself.

The reverse engineering is by no means complete. We wanted to get to the point
where the source can be modified and re-assembled, but we're too far from there,
too many addresses still hardcoded without their proper label. We just didn't
have enough time to devote to this project, but feel it is still worth releasing.

## Tools

- **SkoolKit**: [http://skoolkit.ca/](http://skoolkit.ca/) Note: requires Python 3.4+
- **Fuse - The Free Unix Spectrum Emulator**: [http://fuse-emulator.sourceforge.net/](http://fuse-emulator.sourceforge.net/) Don't worry, it's been ported to many operating systems besides Unix.
- **SjAsmPlus**: [https://github.com/mkoloberdin/sjasmplus](https://github.com/mkoloberdin/sjasmplus)
- **stb_image_write**: [http://nothings.org/stb/stb_image_write.h](http://nothings.org/stb/stb_image_write.h)

## Credits

Credits for the original game:

- Javier Arevalo: programming, level design and art,
- Juan Carlos Arevalo: programming, design
- Julio Martin: HUD, sprites, most art
- Gonzalo Martin and Cesar Astudillo "Gominolas": Music
- Javier Cano: production
- Jose Manuel Muñoz: original concept
- Originally published by Topo Soft in 1987

# License

This work is licensed under the [Creative Commons Attribution-NonCommercial-NoDerivatives
4.0 International License](http://creativecommons.org/licenses/by-nc-nd/4.0/).  To view a copy of this license, visit [http://creativecommons.org/licenses/by-nc-nd/4.0/](http://creativecommons.org/licenses/by-nc-nd/4.0/) or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.

![by-nc-nd-4.0](https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png)

All work is the property of the original authors. Any portions of the game
that may be published here are for historical and archival value. Any
commercial use of the code, graphics, design or music from the original
game is not permitted.
