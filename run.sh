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


$APP_INTERPRETER_PATH/bin/python2 main.py
