# DESTool - a GUI for libFAUDES


DESTool is a GUI to play along with libFAUDES objecst and algorithms, i.e.,
- enter automata graphicaly or as table
- run synthesis algorithms to obtain a supevisor
- simullate the compoiund system, optionally with hardware in the loop

Further information
- [online documentation](https://fgdes.tf.fau.de/destool/index.html
- [download precompiled binaries](https://fgdes.tf.fau.de/archive/preview/#arch)

## Build Process

To build DESTool, you wull need get and compile  copieslibFAUDES and LibVIODES. We recommend the following
folder layout:

    -> whereever + -> libFAUDES
                 + -> libVIODES
                 + -> DESTool

The build process is then organised in 4 stages.

1. copy libFAUDES and libVIODES essentials (executables and shared objects)   

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


## Copyright/Authors/License

DESTool is distributed under terms of the GLP vession 3; for details see the provided
LICENSE file. Building on libFAUDES and libVIODES, DESTool benefits from a various student
projects and external contributions. A list of authors is generated on the About-Page. 


Copyright (C) 2011-2024 Thomas Moor
