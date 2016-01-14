#!/bin/sh

if [ $# -eq 0 ]
  then
    echo "#############################"
    echo "No arguments supplied"
    echo "Usage ./go.sh <single-letter>"
    echo "e.g."
    echo "      ./go.sh B"
    echo "#############################"
    exit 1
fi

ruby ./go.rb $@
