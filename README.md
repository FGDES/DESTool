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

The build process is then organised in 4 stages.

0. configure and compile libFAUDES and libVIODES; instructions come with the respective source code

1. copy libFAUDES and libVIODES essentials to the DESTool sources (executables and shared objects)   

        cd wherever/DESTool
        . ./copyfaudes.sh

2. build the install tool  `dstinstall`

        cd wherever/DESTool/dstinstall
        qmake dstinstall.pro
        make

3. build the documentation (requires libFAUDES essentials and dstinstall)

        cd wherever/DESTool/doc
        make 

4. finally build DESTool

        cd wherever/DESTool
        qmake destool.pro
        make

This is quite some process, hence we provide precomipiled binaries. 

## Copyright/Authors/License

DESTool is distributed under terms of the GLP vession 3; for details see the provided
LICENSE file. Building on libFAUDES and libVIODES, DESTool benefits from a various student
projects and external contributions. DESTool produces a list of libFAUDES
authors/contributors vai its About dialog.


Copyright (C) 2008-2024 Thomas Moor
