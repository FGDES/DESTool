REM ================================== copy all destool libs (Qt4 version)



REM ========= copy qt libs
copy /Y %FAUDES_QT%\bin\QtCore4.dll release
copy /Y %FAUDES_QT%\bin\QtGui4.dll release
copy /Y %FAUDES_QT%\bin\QtSvg4.dll release
copy /Y %FAUDES_QT%\bin\QtXml4.dll release
REM copy /Y %FAUDES_MIN%\bin\mingwm10.dll release
REM copy /Y %FAUDES_MIN%\bin\libgcc_s_dw2-1.dll release
REM copy /Y "%FAUDES_MIN%\bin\libstdc++-6.dll" release
REM copy /Y "%FAUDES_MIN%\bin\libgcc_s_sjlj-1.dll" release
REM copy /Y "%FAUDES_MIN%\bin\libwinpthread-1.dll" release



mkdir release\plugins
mkdir release\plugins\imageformats
copy /Y %FAUDES_QT%\plugins\imageformats\qjpeg4.dll release\plugins\imageformats
copy /Y %FAUDES_QT%\plugins\imageformats\qsvg4.dll release\plugins\imageformats
copy /Y %FAUDES_QT%\bin\qhelpgenerator.exe release
copy /Y %FAUDES_QT%\bin\qcollectiongenerator.exe release


REM ============ copy viodes libs
mkdir release\plugins\viotypes
copy /Y ..\libviodes\libfaudes_for_viodes\faudes.dll  release
copy /Y ..\libviodes\libfaudes_for_viodes\include\libfaudes.rti  release
copy /Y ..\libviodes\libfaudes_for_viodes\bin\luafaudes.flx  release
copy /Y ..\libviodes\viodes.dll release
copy /Y ..\libviodes\viogen.dll release\plugins\viotypes
copy /Y ..\libviodes\viohio.dll release\plugins\viotypes
copy /Y ..\libviodes\viomtc.dll release\plugins\viotypes
copy /Y ..\libviodes\viosim.dll release\plugins\viotypes
copy /Y ..\libviodes\viodiag.dll release\plugins\viotypes
copy /Y ..\libviodes\violua.dll release\plugins\viotypes
copy /Y ..\libviodes\vioedit\data\vioconfig.txt release

REM ============ my tools
copy /Y .\dstinstall\release\dstinstall.exe release
mkdir release\plugins\luaextensions
REM copy /Y .\tutorial\distsave\LuaExtensions\*.* release\plugins\luaextensions
copy /Y ..\libviodes\libfaudes_for_viodes\stdflx\*.* release\plugins\luaextensions
   
