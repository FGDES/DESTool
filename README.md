# DESTool - a GUI for libFAUDES


DESTool is a GUI to play along with libFAUDES objecst and algorithms, i.e.,
- enter automata graphicaly or as table
- run synthesis algorithms to obtain a supevisor
- simullate the compoiund system, optionally with hardware in the loop

Further information
- [online documentation](https://fgdes.tf.fau.de/destool/index.html
- [download precompiled binaries](https://fgdes.tf.fau.de/archive/preview/#arch)

## Build Process

To build DESTool, you wull need a copieslibFAUDES and LibVIODES and have them
compiled first to the following folder layout:

    -> whereever + -> libFAUDES
                 + -> libVIODES
                 + -> DESTool

Within the DESTool folder run the following commands.

- build the install tool 

        cd wherever/DESTool/dstinstall
        qmake dstinstall.pro
        make

- copy libFAUDES and libVIODES essentials    

        cd wherever/DESTool
        . ./copyfaudes.sh

- build the documentation

        cd wherever/DESTool/doc
        make 

- build DESTool

        cd wherever/DESTool
        qmake destool.pro
        make


## Copyright/Authors/License

DESTool is distributed under terms of the GLP vession 3; for details see the provided
LICENSE file. Building on libFAUDES and libVIODES, DESTool benefits a number of studemt
projects and externa contributions. A list of authors is generated on the About-Page. 


Copyright (C) 2011-2024 Thomas Moor
