import re
import os
from setuptools import setup, find_packages

# Read version from file without loading the module
with open('src/DobbyCommonLibrary/version.py', 'r') as version_file:
    version_match = re.search(r"^VERSION ?= ?['\"]([^'\"]*)['\"]", version_file.read(), re.M)
if version_match:
    VERSION=version_match.group(1)
else:
    VERSION='0.1'

requirements = [
    'robotframework',
    'robotframework-browsermobproxylibrary==0.1.3',
    'robotframework-seleniumlibrary==6.7.1',
    'robotframework-pdf2textlibrary==1.0.1',
    'robotframework-pabot==2.18.0',
    'robotframework-jsonlibrary==0.3.1',
    'robotframework-imaplibrary2==0.4.0',
    'robotframework-excellib==2.0.1',
    'robotframework-appiumlibrary==3.1',
    'PyYAML==5.3.1',
    'DateTime==4.3',
    'openpyxl==3.0.9',
    'opencv-python==4.5.5.62',
    'cryptography==38.0.4'
]

test_requirements = [
    # TODO: put package test requirements here
]


CLASSIFIERS = """
Programming Language :: Python
Programming Language :: Python :: 2
Programming Language :: Python :: 3
License :: OSI Approved :: MIT License
Operating System :: OS Independent
Framework :: Robot Framework
Framework :: Robot Framework :: Library
"""[1:-1]


setup(
    name='robotframework-DobbyCommonLibrary',
    version=VERSION,
    description="doppio common library for robot framework",
    author="Doppio Tech",
    author_email='darawalee.p@doppio-tech.com',
    url='https://gitlab.com/doppiotech/dp-common',
    packages=find_packages(where='src'),
    package_dir={'': 'src'},
    include_package_data=True,
    install_requires=requirements,
    zip_safe=False,
    keywords='DobbyWebCommon, DobbyCommon, DobbyAppCommon,DobbyCommonLibrary',
    classifiers=CLASSIFIERS.splitlines(),
    test_suite='tests',
    tests_require=test_requirements
)