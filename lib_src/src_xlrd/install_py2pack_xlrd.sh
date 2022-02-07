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
PACKAGE_NAME="xlrd"

#Pass installation directory as argument 1 - if not in config
if [ ! -z "$1" ]; then
    PYTHON_INTERPRETER="$1"
else
    echo "error_usage: pass python interpreter location"
    echo 
    echo "Ex: $0 </home/test_user/mypy2/bin/python2>"
    echo
    exit 1
fi

if [ ! -f "$PYTHON_INTERPRETER" ]; then
    echo "error: python interpreter missing @ ($PYTHON_INTERPRETER). Specify Proper python Path"
    exit 1
fi

echo "Python Interpreter Path : $PYTHON_INTERPRETER"

cd $PACKAGE_NAME
[ $? -ne 0 ] && { echo "error line ( ${LINENO} )"; exit 1; }

if [ ! -f setup.py ]; then
    echo "error: setup.py missing"
    exit 1
fi

$PYTHON_INTERPRETER setup.py install
