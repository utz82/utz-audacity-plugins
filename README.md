# utz' audacity plugins

A collection of mostly trivial Nyquist plugins for the [Audacity](https://www.audacityteam.org/) audio editor. Currently contains the following plug-ins:


### bitcrush
A simple bitcrusher, simulating the effect of reducing the bitrate to anywhere between 1 and 16 bits. Strangely enough Audacity doesn't have this built in.

### chopper
Rhythmically chops up the given selection, based on a given pattern. The pattern is a string of 0s and 1s, where 0 means silence and 1 means pass-thru. The pattern can be repeated up to 256 times. Also called a gater in some DAWs.

### overdrive
Another simple effect I've often missed in Audacity. Applies a simple clip&gain.


All code is released under the terms of the MIT License.