@echo off
set cvm_bin_folder=%~dp0
rem echo %cvm_bin_folder%
set curl_bin_path=%cvm_bin_folder%\utils\curl.exe
set unzip_bin_path=%cvm_bin_folder%\utils\7z.exe
set major=%1
set minor=%2
set patch=%3
set version=%major%.%minor%.%patch%
rem echo version is %version%
if "%major%"=="" (
	echo usage: cvm [major] [minor] [patch], for example: cvm 3 4 1
	exit /b 2
)
if "%minor%"=="" (
	echo usage: cvm [major] [minor] [patch], for example: cvm 3 4 1
	exit /b 2
)
if "%patch%"=="" (
	echo usage: cvm [major] [minor] [patch], for example: cvm 3 4 1
	exit /b 2
)

set url=https://cmake.org/files/v%major%.%minor%/cmake-%version%-win32-x86.zip
set folder_name=cmake-%version%-win32-x86
set file_name=%folder_name%.zip

set cvm_home=%HOMEDRIVE%%HOMEPATH%\.cvm
rem echo %cvm_home%
if not exist "%cvm_home%" (md "%cvm_home%")
rem echo %curl_bin_path%
rem echo %unzip_bin_path%

if not exist "%cvm_home%\%folder_name%" (
	echo downloading cmake version %version%
	echo from: %url%
	echo to: %cvm_home%\%file_name%.zip
	pushd %cvm_home%
	%curl_bin_path% -O %url% 
	%unzip_bin_path% x cmake-%version%-win32-x86.zip -aoa
)
echo setting cmake version to %version%
set PATH=%cvm_home%\%folder_name%\bin;%PATH%
echo done, please run cmake --version to verify 
popd