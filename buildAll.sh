#!/bin/bash

echo "Building docker images....."
CURR_FOLDER=`pwd`

cd base
docker build . -t "glanf/base"
cd $CURR_FOLDER

for folder in $(ls -d *)
do
    FOLDER="$CURR_FOLDER/$folder"
    if [[ -d $FOLDER ]]; then
        if [[ $FOLDER == *"base"* ]]; then
            echo "Already built base image..."
        else
            cd $FOLDER
            docker build . -t "glanf/$folder"
        fi
    fi
    cd $CURR_FOLDER
done

echo "-----------------------------------"
echo "Setting .bashrc"

GLANF_FOLDER="$CURR_FOLDER/testing"
echo "export GLANF_HOME=\"$GLANF_FOLDER/\"" >> ~/.bashrc
echo "export PATH=\"$PATH:$GLANF_HOME\"" >> ~/.bashrc
echo "alias glanf_start=\"sudo $GLANF_HOME/glanf start\"" >> ~/.bashrc
echo "alias glanf_stop=\"sudo $GLANF_HOME/glanf stop\"" >> ~/.bashrc
echo "alias glanf_clean=\"sudo $GLANF_HOME/glanf clean\"" >> ~/.bashrc
echo "alias glanf_reset=\"sudo $GLANF_HOME/glanf stop && sudo $GLANF_HOME/glanf clean\"" >> ~/.bashrc
