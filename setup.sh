#!/bin/bash

chmod +x ./config.sh
chmod +x ./clean.sh
chmod +x ./run.sh
chmod +x ./lib_src/src_xlrd/install_py2pack_xlrd.sh
chmod +x ./lib_src/src_python2.7.9/py2_install_macOS10.15.7_from_disk.sh


source ./config.sh

if [ $? -ne 0 ]; then
    echo "error: importing config.sh"
    exit 1
fi

C_DIR="`pwd`"

which brew 1>/dev/null 2>/dev/null

if [ $? -ne 0 ]; then
    echo "error: brew should be installed first"
    echo ""
    echo "help:"
    echo ""
    echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    echo ""
    echo ""
    exit 1
fi



if [ -z $APP_INTERPRETER_PATH ]; then
    echo
    echo " APP_INTERPRETER_PATH is empty"
    echo
    exit 1
fi



cd "$C_DIR/lib_src/src_python2.7.9/"

./py2_install_macOS10.15.7_from_disk.sh "$APP_INTERPRETER_PATH"
[ $? -ne 0 ] && { echo "error line ( ${LINENO} )"; exit 1; }

cd "$C_DIR/lib_src/src_xlrd/"
./install_py2pack_xlrd.sh "$APP_INTERPRETER_PATH/bin/python2"
[ $? -ne 0 ] && { echo "error line ( ${LINENO} )"; exit 1; }

