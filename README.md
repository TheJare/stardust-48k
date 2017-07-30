# Stardust rebuilt

This little project tries to recover a reasonable version of the source code
for our game Stardust, to celebrate the 30 years since its original release
back in 1987.

I have focused on the Sinclair ZX Spectrum version of the game. We ported it
to the Amstrad CPC, while other people did the MSX, C-64 and eventual PC
versions. But my nostalgia starts and ends with the Spectrum.

## How was this done?

I downloaded a few Spectrum emulators since I didn't know which were best
and what they could do. I settled on Fuse and its toolset. Next was an image
of the tape from the original Spanish release. I ran the tape in the emulator
and waited for the game to load. It does a little intro and credits sequence,
which I didn't bother to capture. Once the game was in the main menu, I
grabbed a snapshot in z80 format, and worked from there.

- Capture a profile of the game running, and generate a map file that will
contain the code sections that have been executed. This should include most
code, and hopefully lead to an almost-ready-to-assemble source file.
- Use SkoolKit with the snapshot and the map file, to create a control file
that contains information on the snapshot memory map: code and data sections,
mainly.

Now we iterate on this point as many times as needed (a lot) to improve
the control file and reach a very complete assembly file.

- Generate an assembly source file from the snapshot and the control file
- Study the assembly code and iterate on the control file to add more
information: labels, comments, better delineation of data sections, etc.

At any point, with the assembly file in a good state, we can generate an executable.

- Assemble the source code into a binary, and convert it to snapshot format,
with a valid stack pointer and entry point. Note the original snapshot was
captured in the middle of the game running, but I wanted a reasonable
entry point that sets everything up.
- Tweak the snapshot to set the border color and disable interrupts.
- At this point we have a valid snapshot that can be loaded and runs fine.

I work on a Windows machine, so I have documented the commands to run the
above steps inside the file [b.cmd](b.cmd). Adapt the paths in that file to
your own installation if you want to use run it yourself.

## Tools

- *SkoolKit*: [http://skoolkit.ca/](http://skoolkit.ca/) Note: requires Python 3.4+
- *Fuse - The Free Unix Spectrum Emulator*: [http://fuse-emulator.sourceforge.net/](http://fuse-emulator.sourceforge.net/) Don't worry, it's been ported to many operating systems besides Unix.
- *SjAsmPlus*: [https://github.com/mkoloberdin/sjasmplus](https://github.com/mkoloberdin/sjasmplus)

## Credits

Credits for the original game:

- Javier Arevalo: programming, level design, stage 1 level art
- Juan Carlos Arevalo: programming, design
- Julio Martin: sprite art, all 2nd stage art
- Gonzalo Martin and Cesar Astudillo: Music
- Javier Cano: production
- Jose Manuel Muñoz: original concept
- Published by Topo Soft

# License

This work is licensed under the [Creative Commons Attribution-NonCommercial-NoDerivatives
4.0 International License](http://creativecommons.org/licenses/by-nc-nd/4.0/).  To view a copy of this license, visit [http://creativecommons.org/licenses/by-nc-nd/4.0/](http://creativecommons.org/licenses/by-nc-nd/4.0/) or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.

![by-nc-nd-4.0](https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png)

All work is the property of the original authors. Any portions of the game
that may be published here are for historical and archival value. Any
commercial use of the code, graphics, design or music from the original
game is not permitted.
