# Microsoft Developer Studio Project File - Name="Generic" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=Generic - Win32 Checked
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Generic.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Generic.mak" CFG="Generic - Win32 Checked"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Generic - Win32 Free" (based on "Win32 (x86) Application")
!MESSAGE "Generic - Win32 Checked" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Generic - Win32 Free"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "objfre_wxp_x86\i386"
# PROP BASE Intermediate_Dir "objfre_wxp_x86\i386"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "objfre_wxp_x86\i386"
# PROP Intermediate_Dir "objfre_wxp_x86\i386"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP -nologo -DCONDITION_HANDLING=1 -DDBG=0 -DDEVL=1 -DDRIVER -DFPO=1 -DNDEBUG -DNT_INST=0 -DNT_UP=1 -DSTD_CALL -DWIN32 -DWIN32=100 -DWIN32_LEAN_AND_MEAN=1 -DWINNT=1 -DWINVER=0x0501 -D_DLL=1 -D_IDWBUILD -D_MBCS -D_NT1X_=100 -D_WIN32_IE=0x0600 -D_WIN32_WINNT=0x0501 -D_WINDOWS -D_X86_=1 -Di386=1 -FD -FI$(ddkpath)\inc\wxp\warning.h -FR -G6 -GF -GR- -GX- -Gi- -Gm- -Gy -Gz -O2 -Oxs -Oy -QI0f -QIf -QIfdiv- -W3 -WX -Yu"stddcls.h" -Zel -Zp8  -c -cbstring -I$(ddkpath)\inc\wxp -I"$(ddkpath)\inc\ddk\wxp" -I"$(ddkpath)\inc\ddk\wdm\wxp" -I"$(ddkpath)\inc\crt" 
# ADD CPP -nologo -DCONDITION_HANDLING=1 -DDBG=0 -DDEVL=1 -DDRIVER -DFPO=1 -DNDEBUG -DNT_INST=0 -DNT_UP=1 -DSTD_CALL -DWIN32 -DWIN32=100 -DWIN32_LEAN_AND_MEAN=1 -DWINNT=1 -DWINVER=0x0501 -D_DLL=1 -D_IDWBUILD -D_MBCS -D_NT1X_=100 -D_WIN32_IE=0x0600 -D_WIN32_WINNT=0x0501 -D_WINDOWS -D_X86_=1 -Di386=1 -FD -FI$(ddkpath)\inc\wxp\warning.h -FR -G6 -GF -GR- -GX- -Gi- -Gm- -Gy -Gz -O2 -Oxs -Oy -QI0f -QIf -QIfdiv- -W3 -WX -Yu"stddcls.h" -Zel -Zp8  -c -cbstring -I$(ddkpath)\inc\wxp -I"$(ddkpath)\inc\ddk\wxp" -I"$(ddkpath)\inc\ddk\wdm\wxp" -I"$(ddkpath)\inc\crt" 
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG" /i $(ddkpath)\inc\wxp /i "$(ddkpath)\inc\ddk\wxp" /i "$(ddkpath)\inc\ddk\wdm\wxp" /i "$(ddkpath)\inc\crt" 
# ADD RSC /l 0x409 /d "NDEBUG" /i $(ddkpath)\inc\wxp /i "$(ddkpath)\inc\ddk\wxp" /i "$(ddkpath)\inc\ddk\wdm\wxp" /i "$(ddkpath)\inc\crt" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 -nologo -align:0x80 -base:0x10000 -debug:full -debugtype:cv -debugtype:cv -driver:wdm -entry:DriverEntry@8 -fullbuild -ignore:4010,4037,4039,4049,4065,4070,4078,4087,4089,4198,4221 -incremental:no -libpath:"$(ddkpath)\lib\wxp\i386" -merge:_PAGE=PAGE -merge:_TEXT=.text -nodefaultlib -opt:icf -opt:nowin98 -opt:ref -osversion:4.00 -release -section:init,d -stack:0x40000,0x1000 -subsystem:native,4.00 -version:5.1 wdm.lib wmilib.lib  -out:objfre_wxp_x86\i386\generic.sys
# ADD LINK32 -nologo -align:0x80 -base:0x10000 -debug:full -debugtype:cv -debugtype:cv -driver:wdm -entry:DriverEntry@8 -fullbuild -ignore:4010,4037,4039,4049,4065,4070,4078,4087,4089,4198,4221 -incremental:no -libpath:"$(ddkpath)\lib\wxp\i386" -merge:_PAGE=PAGE -merge:_TEXT=.text -nodefaultlib -opt:icf -opt:nowin98 -opt:ref -osversion:4.00 -release -section:init,d -stack:0x40000,0x1000 -subsystem:native,4.00 -version:5.1 wdm.lib wmilib.lib  -out:objfre_wxp_x86\i386\generic.sys
# Begin Special Build Tool
TargetPath=.\objfre_wxp_x86\i386\Generic.sys
SOURCE="$(InputPath)"
PostBuild_Cmds=$(SIWPATH)\nmsym -translate:source,package,always $(TargetPath)
# End Special Build Tool

!ELSEIF  "$(CFG)" == "Generic - Win32 Checked"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "objchk_wxp_x86\i386"
# PROP BASE Intermediate_Dir "objchk_wxp_x86\i386"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "objchk_wxp_x86\i386"
# PROP Intermediate_Dir "objchk_wxp_x86\i386"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP -nologo -DCONDITION_HANDLING=1 -DDBG=1 -DDEVL=1 -DDRIVER -DFPO=0 -DNDEBUG -DNT_INST=0 -DNT_UP=1 -DRDRDBG -DSRVDBG -DSTD_CALL -DWIN32 -DWIN32=100 -DWIN32_LEAN_AND_MEAN=1 -DWINNT=1 -DWINVER=0x0501 -D_DEBUG -D_DLL=1 -D_IDWBUILD -D_MBCS -D_NT1X_=100 -D_WIN32_IE=0x0600 -D_WIN32_WINNT=0x0501 -D_WINDOWS -D_X86_=1 -Di386=1 -FD -FI$(ddkpath)\inc\wxp\warning.h -FR -G6 -GF -GR- -GX- -Gi- -Gm- -Gy -Gz -Od -Oi -Oy- -QI0f -QIf -QIfdiv- -W3 -WX -Yu"stddcls.h" -Z7 -Zel -Zp8  -c -cbstring -I$(ddkpath)\inc\wxp -I"$(ddkpath)\inc\ddk\wxp" -I"$(ddkpath)\inc\ddk\wdm\wxp" -I"$(ddkpath)\inc\crt" 
# ADD CPP -nologo -DCONDITION_HANDLING=1 -DDBG=1 -DDEVL=1 -DDRIVER -DFPO=0 -DNDEBUG -DNT_INST=0 -DNT_UP=1 -DRDRDBG -DSRVDBG -DSTD_CALL -DWIN32 -DWIN32=100 -DWIN32_LEAN_AND_MEAN=1 -DWINNT=1 -DWINVER=0x0501 -D_DEBUG -D_DLL=1 -D_IDWBUILD -D_MBCS -D_NT1X_=100 -D_WIN32_IE=0x0600 -D_WIN32_WINNT=0x0501 -D_WINDOWS -D_X86_=1 -Di386=1 -FD -FI$(ddkpath)\inc\wxp\warning.h -FR -G6 -GF -GR- -GX- -Gi- -Gm- -Gy -Gz -Od -Oi -Oy- -QI0f -QIf -QIfdiv- -W3 -WX -Yu"stddcls.h" -Z7 -Zel -Zp8  -c -cbstring -I$(ddkpath)\inc\wxp -I"$(ddkpath)\inc\ddk\wxp" -I"$(ddkpath)\inc\ddk\wdm\wxp" -I"$(ddkpath)\inc\crt" 
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG" /i $(ddkpath)\inc\wxp /i "$(ddkpath)\inc\ddk\wxp" /i "$(ddkpath)\inc\ddk\wdm\wxp" /i "$(ddkpath)\inc\crt" 
# ADD RSC /l 0x409 /d "_DEBUG" /i $(ddkpath)\inc\wxp /i "$(ddkpath)\inc\ddk\wxp" /i "$(ddkpath)\inc\ddk\wdm\wxp" /i "$(ddkpath)\inc\crt" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 -nologo -align:0x80 -base:0x10000 -debug:full -debugtype:cv -debugtype:cv -driver:wdm -entry:DriverEntry@8 -fullbuild -ignore:4010,4037,4039,4049,4065,4070,4078,4087,4089,4198,4221 -incremental:no -libpath:"$(ddkpath)\lib\wxp\i386" -merge:_PAGE=PAGE -merge:_TEXT=.text -nodefaultlib -opt:icf -opt:nowin98 -opt:ref -osversion:4.00 -release -section:init,d -stack:0x40000,0x1000 -subsystem:native,4.00 -version:5.1 wdm.lib wmilib.lib  -out:objchk_wxp_x86\i386\generic.sys
# ADD LINK32 -nologo -align:0x80 -base:0x10000 -debug:full -debugtype:cv -debugtype:cv -driver:wdm -entry:DriverEntry@8 -fullbuild -ignore:4010,4037,4039,4049,4065,4070,4078,4087,4089,4198,4221 -incremental:no -libpath:"$(ddkpath)\lib\wxp\i386" -merge:_PAGE=PAGE -merge:_TEXT=.text -nodefaultlib -opt:icf -opt:nowin98 -opt:ref -osversion:4.00 -release -section:init,d -stack:0x40000,0x1000 -subsystem:native,4.00 -version:5.1 wdm.lib wmilib.lib  -out:objchk_wxp_x86\i386\generic.sys
# Begin Special Build Tool
TargetPath=.\objchk_wxp_x86\i386\Generic.sys
SOURCE="$(InputPath)"
PostBuild_Cmds=copy $(TargetPath) $(WINDIR)\system32\drivers	$(SIWPATH)\nmsym -translate:source,package,always $(TargetPath)
# End Special Build Tool

!ENDIF 

# Begin Target

# Name "Generic - Win32 Free"
# Name "Generic - Win32 Checked"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\Control.cpp
# End Source File
# Begin Source File

SOURCE=.\DevQueue.cpp
# End Source File
# Begin Source File

SOURCE=.\driver.rc
# End Source File
# Begin Source File

SOURCE=.\DriverEntry.cpp
# End Source File
# Begin Source File

SOURCE=.\Generic.def
# End Source File
# Begin Source File

SOURCE=.\PlugPlay.cpp
# End Source File
# Begin Source File

SOURCE=.\Power.cpp
# End Source File
# Begin Source File

SOURCE=.\RemoveLock.cpp
# End Source File
# Begin Source File

SOURCE=.\stddcls.cpp
# ADD CPP /Yc"stddcls.h"
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\Driver.h
# End Source File
# Begin Source File

SOURCE=.\Generic.h
# End Source File
# Begin Source File

SOURCE=.\GenericPower.h
# End Source File
# Begin Source File

SOURCE=.\stddcls.h
# End Source File
# Begin Source File

SOURCE=.\version.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
