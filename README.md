# DESTool - a GUI for libFAUDES


DESTool is a GUI to play along with libFAUDES objecst and algorithms, i.e.,
- enter automata graphically or as spread sheet
- run synthesis algorithms to obtain a supevisor
- simulate the compound system, optionally with hardware in the loop

Further information
- [online documentation](https://fgdes.tf.fau.de/destool/index.html)
- [download precompiled binaries](https://fgdes.tf.fau.de/archive/preview/#arch)

## Build Process

In the case you want to build DESTool yourself, you can retrieve the sources
from our GitHub repository.
You will also need to get the sources of libFAUDES and libVIODES. We recommend the following
folder layout:

    -> where_ever + -> libFAUDES
                  + -> libVIODES
                  + -> DESTool

The build process is then organised in 2 stages.

1. configure and compile libFAUDES and libVIODES; instructions come with the respective source code; allthough libVIODES is fine with Qt 5.12.12, DESTool will requiere Qt 5.15.3 or better Qt series 6.

2. build DESTool

        cd wherever/DESTool
        qmake destool.pro
        make


## Copyright/Authors/License

DESTool is distributed under terms of the GLP vession 3; for details see the provided
LICENSE file. Building on libFAUDES and libVIODES, DESTool benefits from a various student
projects and external contributions. DESTool produces a list of libFAUDES
authors/contributors via its About dialog.


Copyright (C) 2008-2025 Thomas Moor
