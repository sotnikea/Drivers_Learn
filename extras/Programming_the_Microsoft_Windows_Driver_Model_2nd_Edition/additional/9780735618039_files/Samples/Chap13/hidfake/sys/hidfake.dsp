# Microsoft Developer Studio Project File - Name="hidfake" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=hidfake - Win32 Checked
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "hidfake.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "hidfake.mak" CFG="hidfake - Win32 Checked"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "hidfake - Win32 Free" (based on "Win32 (x86) Application")
!MESSAGE "hidfake - Win32 Checked" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "hidfake - Win32 Free"

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
# ADD BASE CPP /nologo /G6 /Gz /W3 /WX /O2 /I "$(wdmbook)\generic" /I "$(ddkpath)\inc\wxp" /I "$(ddkpath)\inc\ddk\wxp" /I "$(ddkpath)\inc\ddk\wdm\wxp" /I "$(ddkpath)\inc\crt" /FI"$(ddkpath)\inc\wxp\warning.h" /D CONDITION_HANDLING=1 /D DBG=0 /D DEVL=1 /D "DRIVER" /D FPO=1 /D "NDEBUG" /D NT_INST=0 /D NT_UP=1 /D "STD_CALL" /D "WIN32" /D WIN32=100 /D WIN32_LEAN_AND_MEAN=1 /D WINNT=1 /D WINVER=0x0501 /D _DLL=1 /D "_IDWBUILD" /D "_MBCS" /D _NT1X_=100 /D _WIN32_IE=0x0600 /D _WIN32_WINNT=0x0501 /D "_WINDOWS" /D _X86_=1 /D i386=1 /FR /Yu"stddcls.h" /FD -GF -Oxs -QI0f -QIf -QIfdiv- -Zel -cbstring /c
# ADD CPP /nologo /G6 /Gz /W3 /WX /O2 /I "$(wdmbook)\generic" /I "$(ddkpath)\inc\wxp" /I "$(ddkpath)\inc\ddk\wxp" /I "$(ddkpath)\inc\ddk\wdm\wxp" /I "$(ddkpath)\inc\crt" /FI"$(ddkpath)\inc\wxp\warning.h" /D CONDITION_HANDLING=1 /D DBG=0 /D DEVL=1 /D "DRIVER" /D FPO=1 /D "NDEBUG" /D NT_INST=0 /D NT_UP=1 /D "STD_CALL" /D "WIN32" /D WIN32=100 /D WIN32_LEAN_AND_MEAN=1 /D WINNT=1 /D WINVER=0x0501 /D _DLL=1 /D "_IDWBUILD" /D "_MBCS" /D _NT1X_=100 /D _WIN32_IE=0x0600 /D _WIN32_WINNT=0x0501 /D "_WINDOWS" /D _X86_=1 /D i386=1 /FR /Yu"stddcls.h" /FD -GF -Oxs -QI0f -QIf -QIfdiv- -Zel -cbstring /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /i "$(wdmbook)\generic" /i "$(ddkpath)\inc\wxp" /i "$(ddkpath)\inc\ddk\wxp" /i "$(ddkpath)\inc\ddk\wdm\wxp" /i "$(ddkpath)\inc\crt" /d "NDEBUG"
# ADD RSC /l 0x409 /i "$(wdmbook)\generic" /i "$(ddkpath)\inc\wxp" /i "$(ddkpath)\inc\ddk\wxp" /i "$(ddkpath)\inc\ddk\wdm\wxp" /i "$(ddkpath)\inc\crt" /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ntoskrnl.lib hal.lib generic.lib wdm.lib wmilib.lib /nologo /base:"0x10000" /version:5.1 /stack:0x40000,0x1000 /entry:"DriverEntry@8" /machine:IX86 /nodefaultlib /out:"objfre_wxp_x86\i386\hidfake.sys" /libpath:"$(ddkpath)\lib\wxp\i386" /libpath:"$(wdmbook)\generic\objfre_wxp_x86\i386" -align:0x80 -debug:full -driver:wdm -fullbuild -ignore:4010,4037,4039,4049,4065,4070,4078,4087,4089,4198,4221 -merge:_PAGE=PAGE -merge:_TEXT=.text -opt:icf -opt:nowin98 -opt:ref -osversion:4.00 -release -section:init,d -subsystem:native,4.00
# ADD LINK32 ntoskrnl.lib hal.lib generic.lib wdm.lib wmilib.lib hidclass.lib /nologo /base:"0x10000" /version:5.1 /stack:0x40000,0x1000 /entry:"DriverEntry@8" /machine:IX86 /nodefaultlib /out:"objfre_wxp_x86\i386\hidfake.sys" /libpath:"$(ddkpath)\lib\wxp\i386" /libpath:"$(wdmbook)\generic\objfre_wxp_x86\i386" -align:0x80 -debug:full -driver:wdm -fullbuild -ignore:4010,4037,4039,4049,4065,4070,4078,4087,4089,4198,4221 -merge:_PAGE=PAGE -merge:_TEXT=.text -opt:icf -opt:nowin98 -opt:ref -osversion:4.00 -release -section:init,d -subsystem:native,4.00
# Begin Custom Build - Finishing up...
IntDir=.\objfre_wxp_x86\i386
TargetPath=.\objfre_wxp_x86\i386\hidfake.sys
TargetName=hidfake
InputPath=.\objfre_wxp_x86\i386\hidfake.sys
SOURCE="$(InputPath)"

"$(IntDir)\$(TargetName).nms" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(SIWPATH)\nmsym -translate:source,package,always $(TargetPath) 
	rebase -b 10000 -x junk $(TargetPath) 
	
# End Custom Build

!ELSEIF  "$(CFG)" == "hidfake - Win32 Checked"

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
# ADD BASE CPP /nologo /G6 /Gz /W3 /WX /Z7 /Oi /Gy /I "$(wdmbook)\generic" /I "$(ddkpath)\inc\wxp" /I "$(ddkpath)\inc\ddk\wxp" /I "$(ddkpath)\inc\ddk\wdm\wxp" /I "$(ddkpath)\inc\crt" /FI"$(ddkpath)\inc\wxp\warning.h" /D CONDITION_HANDLING=1 /D DBG=1 /D DEVL=1 /D "DRIVER" /D FPO=0 /D "NDEBUG" /D NT_INST=0 /D NT_UP=1 /D "RDRDBG" /D "SRVDBG" /D "STD_CALL" /D "WIN32" /D WIN32=100 /D WIN32_LEAN_AND_MEAN=1 /D WINNT=1 /D WINVER=0x0501 /D "_DEBUG" /D _DLL=1 /D "_IDWBUILD" /D "_MBCS" /D _NT1X_=100 /D _WIN32_IE=0x0600 /D _WIN32_WINNT=0x0501 /D "_WINDOWS" /D _X86_=1 /D i386=1 /FR /Yu"stddcls.h" /FD -GF -QI0f -QIf -QIfdiv- -Zel -cbstring /c
# ADD CPP /nologo /G6 /Gz /W3 /WX /Z7 /Oi /Gy /I "$(wdmbook)\generic" /I "$(ddkpath)\inc\wxp" /I "$(ddkpath)\inc\ddk\wxp" /I "$(ddkpath)\inc\ddk\wdm\wxp" /I "$(ddkpath)\inc\crt" /FI"$(ddkpath)\inc\wxp\warning.h" /D CONDITION_HANDLING=1 /D DBG=1 /D DEVL=1 /D "DRIVER" /D FPO=0 /D "NDEBUG" /D NT_INST=0 /D NT_UP=1 /D "RDRDBG" /D "SRVDBG" /D "STD_CALL" /D "WIN32" /D WIN32=100 /D WIN32_LEAN_AND_MEAN=1 /D WINNT=1 /D WINVER=0x0501 /D "_DEBUG" /D _DLL=1 /D "_IDWBUILD" /D "_MBCS" /D _NT1X_=100 /D _WIN32_IE=0x0600 /D _WIN32_WINNT=0x0501 /D "_WINDOWS" /D _X86_=1 /D i386=1 /FR /Yu"stddcls.h" /FD -GF -QI0f -QIf -QIfdiv- -Zel -cbstring /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /i "$(wdmbook)\generic" /i "$(ddkpath)\inc\wxp" /i "$(ddkpath)\inc\ddk\wxp" /i "$(ddkpath)\inc\ddk\wdm\wxp" /i "$(ddkpath)\inc\crt" /d "_DEBUG"
# ADD RSC /l 0x409 /i "$(wdmbook)\generic" /i "$(ddkpath)\inc\wxp" /i "$(ddkpath)\inc\ddk\wxp" /i "$(ddkpath)\inc\ddk\wdm\wxp" /i "$(ddkpath)\inc\crt" /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ntoskrnl.lib hal.lib generic.lib wdm.lib wmilib.lib /nologo /base:"0x10000" /version:5.1 /stack:0x40000,0x1000 /entry:"DriverEntry@8" /incremental:no /machine:IX86 /nodefaultlib /out:"objchk_wxp_x86\i386\hidfake.sys" /libpath:"$(ddkpath)\lib\wxp\i386" /libpath:"$(wdmbook)\generic\objchk_wxp_x86\i386" -align:0x80 -debug:full -driver:wdm -fullbuild -ignore:4010,4037,4039,4049,4065,4070,4078,4087,4089,4198,4221 -merge:_PAGE=PAGE -merge:_TEXT=.text -opt:icf -opt:nowin98 -opt:ref -osversion:4.00 -release -section:init,d -subsystem:native,4.00
# ADD LINK32 ntoskrnl.lib hal.lib generic.lib wdm.lib wmilib.lib hidclass.lib /nologo /base:"0x10000" /version:5.1 /stack:0x40000,0x1000 /entry:"DriverEntry@8" /incremental:no /machine:IX86 /nodefaultlib /out:"objchk_wxp_x86\i386\hidfake.sys" /libpath:"$(ddkpath)\lib\wxp\i386" /libpath:"$(wdmbook)\generic\objchk_wxp_x86\i386" -align:0x80 -debug:full -driver:wdm -fullbuild -ignore:4010,4037,4039,4049,4065,4070,4078,4087,4089,4198,4221 -merge:_PAGE=PAGE -merge:_TEXT=.text -opt:icf -opt:nowin98 -opt:ref -osversion:4.00 -release -section:init,d -subsystem:native,4.00
# Begin Custom Build - Finishing up...
IntDir=.\objchk_wxp_x86\i386
TargetPath=.\objchk_wxp_x86\i386\hidfake.sys
TargetName=hidfake
InputPath=.\objchk_wxp_x86\i386\hidfake.sys
SOURCE="$(InputPath)"

"$(IntDir)\$(TargetName).nms" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(SIWPATH)\nmsym -translate:source,package,always $(TargetPath) 
	copy $(TargetPath) $(WINDIR)\system32\drivers 
	
# End Custom Build

!ENDIF 

# Begin Target

# Name "hidfake - Win32 Free"
# Name "hidfake - Win32 Checked"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\Control.cpp
# End Source File
# Begin Source File

SOURCE=.\driver.rc
# End Source File
# Begin Source File

SOURCE=.\DriverEntry.cpp
# End Source File
# Begin Source File

SOURCE=.\ReadWrite.cpp
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

SOURCE=.\FeatureReports.h
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
# Begin Source File

SOURCE=.\hidfake.inf
# End Source File
# Begin Source File

SOURCE=.\makefile
# End Source File
# Begin Source File

SOURCE=.\ReportDescriptor.hid
# End Source File
# Begin Source File

SOURCE=.\sources
# End Source File
# End Target
# End Project
