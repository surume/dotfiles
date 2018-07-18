#!/bin/bash

logPath=/tmp/brewUpdate.log
/bin/date >> $logPath
/usr/local/bin/brew update >> $logPath
/usr/local/bin/brew upgrade >> $logPath
/usr/local/bin/brew cleanup >> $logPath
