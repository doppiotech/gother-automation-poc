# DobbyCommonLibrary
 doppio common keyword for robot framework

## Installation
Download zip package version from 

https://gitlab.com/doppiotech/dp-common/-/packages

```pip install robotframework-DobbyCommonLibrary.zip```

## Example usage
```bazaar
*** Settings ***
Resource       DobbyCommonLibrary/DobbyCommon.robot
Resource       DobbyCommonLibrary/DobbyWebCommon.robot
Resource       DobbyCommonLibrary/DobbyAppCommon.robot

*** Test Cases ***
TC001
    SeleniumLibrary.Open browser                            http://www.google.com   gc
    DobbyWebCommon.Click element when ready                 name=q
    DobbyWebCommon.Input text to element when ready         name=q  test
    SeleniumLibrary.Close All browsers
```

## Available Keywords
[Keywords](https://doppiotech.gitlab.io/dobbycommonlibrary/)

## Contribution guide
### Decide where is your keyword belong to
```bazaar
App: src/DoppioCommonLibrary/DobbyAppCommon.robot
Web: src/DoppioCommonLibrary/DobbyWebCommon.robot 
Common: src/DoppioCommonLibrary/DobbyCommon.robot 
```

### 1. Add your new keywords to respective test file
```bazaar
App: test/DoppioCommonLibrary/DobbyAppCommon_test.robot
Web: test/DoppioCommonLibrary/DobbyWebCommon_test.robot 
Common: test/DoppioCommonLibrary/DobbyCommon_test.robot 
```

### 2. Run test locally
Make sure you have ``wheel`` , ``twine`` and ``build`` install

python3 -m pip install --upgrade wheel

python3 -m pip install --upgrade twine

python3 -m pip install --upgrade build

then run following bash to build/install and test locally

```bazaar
./test_local.sh
```

### 3. Review process
Make sure pipeline is passed

http://doppio-tech.com:8080/job/DobbyCommon/


Ask for review in #dp-common channel