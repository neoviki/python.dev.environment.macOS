source ./config.sh

if [ $? -ne 0 ]; then
    echo "error: importing config.sh"
    exit 1
fi

if [ -z $APP_INTERPRETER_PATH ]; then
    echo
    echo " ERROR : APP_INTERPRETER_PATH is empty"
    echo
    exit 1
fi

if [ ! -d $APP_INTERPRETER_PATH ]; then
    echo
    echo " INFO : python interpreter dir is missing ( $APP_INTERPRETER_PATH ), nothing to clean  "
    echo
    exit 0
fi

rm -rf $APP_INTERPRETER_PATH
