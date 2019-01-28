#!/bin/bash

CURR_FOLDER=`pwd`
for folder in $(ls -d *)
do
    FOLDER="$CURR_FOLDER/$folder"
    if [[ -d $FOLDER ]]; then
        cd $FOLDER
        docker build . -t "glanf/$folder"
    fi
    cd $CURR_FOLDER
done