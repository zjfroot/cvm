# cmakevm
CMake Version Manager (cvm)

`cvm` is a CMake Version Manager that downloads a specific cmake version and activate it for the current command line session.

Download it from [here] (https://github.com/zjfroot/cmakevm/archive/master.zip), extract it and append the extracted folder to your `PATH`

####On Windows:
From command prompt, type:

`cvm [major] [minor] [patch]`

it will download cmake version [major].[minor].[patch] into `.cvm` folder in your home directory, extract it, and then modify the %PATH% of current command prompt

####On OSX:
From terminal, type:

`cvm.sh [major] [minor] [patch]`

it will download cmake version [major] [minor] [patch] into `.cvm` folder in your home directory, extract it, and then modify the ${PATH}, and then start a new shell

####On Linux:
It should work the same way as on OSX, but it's not verified
