#!/bin/bash
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='Linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='Darwin'
fi
if [ '${platform}' = 'unknown' ]
then
	echo "Currently only Linux and Darwin platforms are supported"
	exit 1
fi
#echo "Detected platform is ${platform}"

cvm_bin_folder="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#echo ${cvm_bin_folder}
major=$1
minor=$2
patch=$3
version=${major}.${minor}.${patch}
#echo "version is ${version}"

if [ -z "${major}" ]
then
	echo "usage: cvm [major] [minor] [patch], for example: cvm 3 4 1"
	exit 1
fi
if [ -z "${minor}" ]
then
	echo "usage: cvm [major] [minor] [patch], for example: cvm 3 4 1"
	exit 1
fi
if [ -z "${patch}" ]
then
	echo "usage: cvm [major] [minor] [patch], for example: cvm 3 4 1"
	exit 1
fi

url=https://cmake.org/files/v${major}.${minor}/cmake-${version}-${platform}-x86_64.tar.gz
folder_name=cmake-${version}-${platform}-x86_64
file_name=${folder_name}.tar.gz
#echo folder name: ${folder_name}
#echo file name: ${file_name}
#echo url: ${url}

cvm_home=${HOME}/.cvm
#echo cvm_home is ${cvm_home}
if [ ! -d "${cvm_home}" ]
then
	echo "creating ${cvm_home}"
	mkdir ${cvm_home}
fi

if [ ! -d "${cvm_home}/${folder_name}" ]
then
	echo downloading cmake version ${version}
	echo from: ${url}
	echo to: ${cvm_home}/${file_name}
	pushd ${cvm_home} > /dev/null
	curl -O ${url}
	tar zxf ${file_name}
	popd > /dev/null
fi
echo setting cmake version to ${version}
if [ "${platform}" = "Darwin" ]
then
	cmake_bin=${cvm_home}/${folder_name}/CMake.app/Contents/bin/
else
	cmake_bin=${cvm_home}/${folder_name}/bin/
fi
echo "export PATH=${cmake_bin}:\${PATH}" > ${cvm_home}/source_me_${version}
echo "done, please run following command to activate CMake ${version}:"
echo 
echo "	source ${cvm_home}/source_me_${version}"