#!/bin/bash

# -----------------------------------------------------
#
#   Python 2 Package Installer ( macOS 10.15.7 )
#   
#       Package Name: xlrd
# -----------------------------------------------------
#
#               Author  : Viki @ Vignesh Natarajan
#               Version : v1.0
#
# -----------------------------------------------------

PYTHON_INTERPRETER="$HOME/mypy2/bin/bin/python2"

source ./config.sh

if [ $? -ne 0 ]; then
    echo "error: importing config.sh"
    exit 1
fi

#Pass installation directory as argument 1 - if not in config
if [ ! -z "$1" ]; then
    PYTHON_INTERPRETER="$1"
fi

echo "Python Interpreter Path : $PYTHON_INTERPRETER"

cd $PACKAGE_NAME
[ $? -ne 0 ] && { echo "error line ( ${LINENO} )"; exit 1; }

if [ ! -f setup.py ]; then
    echo "error: setup.py missing"
    exit 1
fi

$PYTHON_INTERPRETER setup.py install
