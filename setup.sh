source ./config.sh

if [ $? -ne 0 ]; then
    echo "error: importing config.sh"
    exit 1
fi

C_DIR="`pwd`"

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

