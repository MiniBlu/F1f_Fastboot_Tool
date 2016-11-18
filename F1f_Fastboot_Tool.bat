@echo off
::mode con:cols=82 lines=35
Set version=0.1
cls
echo.
echo                          Oppo F1f Fastboot Tool
echo                                by MiniBlu
echo.
echo          Special Thanks goes to UberLaggyDarwin (aka Brinlyaus)
echo      Without his tireless effort this device would be dead in the water.
echo          ---------------------------------------------------------
echo.

set noresources=
set noresourceszip=
If Not Exist "resources" (
	set noresources=1
	echo The resources folder is missing from this tool.
	echo It can not function without its resource files.
	If Exist "resources.zip" goto resourceszip
	echo You need to download resources.zip from github.
	echo  "https://github.com/MiniBlu/F1f_Fastboot_Tool"
	echo Go to the above adress and click "clone or download"
	echo then click "download zip" and extract that zip into this folder.
	echo.
	echo     This tool will now exit.
	pause
	exit
)
If Not Exist "UpdateZips" mkdir UpdateZips
goto main
:resourceszip
echo You need to exrtact the resources.zip file in this tools folder.
echo This tool will now close. Restart it once you have unzipped resources.zip.
pause
exit
:main
cls
echo.
echo                          Oppo F1f Fastboot Tool
echo                                by MiniBlu
echo.
echo          Special Thanks goes to UberLaggyDarwin (aka Brinlyaus)
echo      Without his tireless effort this device would be dead in the water.
echo          ---------------------------------------------------------
echo.
echo                            Options
echo                          -----------
echo.
echo       1 - Veiw Instuctions and Information Page
echo.
echo       2 - Check For Updates
echo.
echo       3 - Install ADB\Fastboot Drivers (Only required Once)
echo.
echo       4 - Flash ColourOs Files
echo.
echo       5 - Flash Project Spectrum Files
echo.
echo       6 - Exit
echo.
Set options=
set /p options=Select an Option:
if "%options%"=="1" goto information
if "%options%"=="2" goto update
if "%options%"=="3" goto drivers
if "%options%"=="4" goto colouros
if "%options%"=="5" goto spectrum
if "%options%"=="6" goto exit
echo.
echo Select a valid option.....
echo ping -n 200 -w 200 127.0.0.1 > nul
goto main

:information
cls
echo.
echo                          Oppo F1f Fastboot Tool
echo                                by MiniBlu
echo.
echo          Special Thanks goes to UberLaggyDarwin (aka Brinlyaus)
echo      Without his tireless effort this device would be dead in the water.
echo          ---------------------------------------------------------
echo.
.
echo.
echo.
echo        Nothing Here Yet
pause
goto main
:update
cls
echo.
echo                          Oppo F1f Fastboot Tool
echo                                by MiniBlu
echo.
echo          Special Thanks goes to UberLaggyDarwin (aka Brinlyaus)
echo      Without his tireless effort this device would be dead in the water.
echo          ---------------------------------------------------------
echo.
echo Checking for Updates
If Exist version.txt del version.txt
resources\wget --no-check-certificate --quiet https://raw.github.com/MiniBlu/F1f_Fastboot_Tool/master/Version.txt
If Not Exist version.txt (
	echo Failed Checking for new version.
	echo Please try again later.
	pause
	goto main
)
echo Current version is %version%
set newversion=
set /p newversion=<Version.txt
echo Latest version is %newversion%
IF "%version%"=="%newversion%" (
	echo You already have the latest version
	)	Else goto update1
If Exist "Version.txt" del Version.txt
pause
goto main

:update1
echo There is a newer Version of this tool.
set bool=
set /p bool=Would you like to download it now (y or n):
if "%bool%"=="y" goto doupdate
if "%bool%"=="n" goto notupdate
echo.
echo Select a valid option.....
echo ping -n 200 -w 200 127.0.0.1 > nul
goto update1

:doupdate
If Exist "Version.txt" del Version.txt
echo.
echo Downloading Updated F1f Fastboot Tool
ren F1f_Fastboot_Tool.bat Old_F1f_Fastboot_Tool.bat
ren resources oldresources
oldresources\wget --no-check-certificate --quiet --show-progress https://raw.github.com/MiniBlu/F1f_Fastboot_Tool/master/F1f_Fastboot_Tool.bat
oldresources\wget --no-check-certificate --quiet --show-progress https://raw.github.com/MiniBlu/F1f_Fastboot_Tool/master/resources.zip
Set failed=
If Not Exist "F1f_Fastboot_Tool.bat" Set failed=1
If Not Exist "resources" Set failed=1
if %failed% EQU 1 goto updatefailed
del Old_F1f_Fastboot_Tool.bat
rmdir /s /q oldresources
echo Update Suceeded. This tool will now exit.
echo Please restart to use the updated version.
pause
Exit
:updatefailed
echo Update Failed, Restoring old version.
If Exist "F1f_fastboot_Tool.bat" (
	del F1f_fastboot_Tool.bat
	ren Old_F1f_Fastboot_Tool.bat F1f_Fastboot_Tool.bat
)
If Exist "resources" (
	rmdir /s /q resources
	ren oldresources resources
)
echo Update Download failed. Please try again later.
pause
goto main
:notupdate
echo.
echo.
echo.
echo You have chosen not to update at this time.
If Exist "Version.txt" del Version.txt
pause
goto main
:drivers

:colouros
cls
echo.
echo                          Oppo F1f Fastboot Tool
echo                                by MiniBlu
echo          Special Thanks goes to UbberaLaggyDarwin (aka Brinlyaus)
echo      Without his tireless effort this device would be dead in the water.
echo.
echo           Flash ColourOS Files
echo               Options
echo             -----------
echo.
echo       1 - Flash BootLoader
echo.
echo       2 - Check For Updates
echo.
echo       3 - Install ADB\Fastboot Drivers (Only required Once)
echo.
echo       4 - Flash ColourOs Files
echo.
echo       5 - Flash Original System.img
echo.
echo       6 - Return to Main Menu
echo.
set options=
set /p options=Select an Option:
if "%options%"=="1" goto information
if "%options%"=="2" goto update
if "%options%"=="3" goto drivers
if "%options%"=="4" goto colouros
if "%options%"=="5" goto origsys
if "%options%"=="6" goto main
echo.
echo Select a valid option.....
echo ping -n 200 -w 200 127.0.0.1 > nul
goto colouros
:origsys
echo Nothing here yet
pause
goto colouros
:spectrum
cls
echo.
echo.
echo.
echo        Nothing Here Yet
pause
goto main

:getmagictricks
REM check for magictricks.zip and download if required
	If Not Exist "UpdateZips\magictricks.zip" (
			echo Downloading magictricks.zip thanks to UbberLaggyDarwin aka Brinlyaus
			resources\wget --no-check-certificate --quiet --show-progress https://strangebinaries.re/f1f/magictricks.zip
			move /Y  magictricks.zip UpdateZips\magictricks.zip
	)	else (
			echo magictricks.zip is already downloaded thanks to UbberLaggyDarwin aka Brinlyaus
		)
REM check for magictricks/emmc_appsboot.mbn and extract if required
	If Not Exist "magictricks\emmc_appsboot.mbn" (
		echo Extracting magictricks\emmc_appsboot.mbn from magictricks.zip
		resources\unzip UpdateZips\magictricks.zip
		move /Y emmc_appsboot.mbn magictricks\emmc_appsboot.mbn
		rmdir /s /q META-INF
	)	else (
			echo magictricks\emmc_appsboot.mbn is already extracted from magictricks.zip
		)
pause
goto main
:exit

cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                               Have   A   Good  Day
ping -n 2 -w 200 127.0.0.1 > nul

cls
exit
