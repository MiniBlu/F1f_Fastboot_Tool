@echo off
::mode con:cols=82 lines=35
Set version=0.1
goto main
:main
cls
echo.
echo                          Oppo F1f Fastboot Tools    
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
echo.
echo.
echo        Nothing Here Yet
pause
goto main
:update
cls
echo current version is %version%
set /p newversion=<Version.txt
echo Latest version is %newversion%
pause
IF "%version%"=="%newversion%" (
	echo You already have the latest version
	)	Else goto update1
pause
goto main

:update1
set /p bool=Would you like to download it now:
if "%bool%"=="y" goto doupdate
if "%bool%"=="n" goto notupdate
echo.
echo Select a valid option.....
echo ping -n 200 -w 200 127.0.0.1 > nul
goto update1

:doupdate
echo.
echo.
echo.
echo        Nothing Here Yet
pause
goto main
:notupdate
echo.
echo.
echo.
echo You have choaen not to update at this time.
pause
goto main
:drivers

:colouros
cls
echo.
echo                          Oppo F1f Fastboot Tools    
echo                                by MiniBlu
echo          Special Thanks goes to UbberaLaggyDarwin (aka Brinlyaus)
echo      Without his tireless effort this device would be dead in the water.
echo.
echo           Flash Colour OS Files
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
REM tools\fastboot wait_for_device
tools\fastboot flash system D:\personal\oppoF1\Orig_Stock_system\system.img
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
			tools\wget --no-check-certificate --quiet --show-progress https://strangebinaries.re/f1f/magictricks.zip
			move /Y  magictricks.zip UpdateZips\magictricks.zip
	)	else (
			echo magictricks.zip is already downloaded thanks to UbberLaggyDarwin aka Brinlyaus
		)
REM check for magictricks/emmc_appsboot.mbn and extract if required
	If Not Exist "magictricks\emmc_appsboot.mbn" (
		echo Extracting magictricks\emmc_appsboot.mbn from magictricks.zip
		tools\unzip UpdateZips\magictricks.zip
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
:checkmagic
cls
echo.
echo.
echo.
REM check for magictricks.zip and download if required
	If Not Exist "UpdateZips\magictricks.zip" (
			echo Downloading magictricks.zip thanks to UbberLaggyDarwin aka Brinlyaus
			echo.
			tools\wget --no-check-certificate --quiet --show-progress https://strangebinaries.re/f1f/magictricks.zip
			move /Y  magictricks.zip UpdateZips\magictricks.zip
	)	else (
			echo magictricks.zip is already downloaded thanks to UbberLaggyDarwin aka Brinlyaus
			echo.
		)
REM check for magictricks/emmc_appsboot.mbn and extract if required
	If Not Exist "magictricks\emmc_appsboot.mbn" (
		echo Extracting magictricks\emmc_appsboot.mbn from magictricks.zip
		echo.
		tools\unzip UpdateZips\magictricks.zip
		move /Y emmc_appsboot.mbn magictricks\emmc_appsboot.mbn
		rmdir /s /q META-INF
	)	else (
			echo magictricks\emmc_appsboot.mbn is already extracted from magictricks.zip
			echo.
		)
pause
goto main


