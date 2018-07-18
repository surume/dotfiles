#!/bin/bash


if ls ~/Desktop/* > /dev/null 2>&1; then
    mv ~/Desktop/* ~/Documents/backup
fi
