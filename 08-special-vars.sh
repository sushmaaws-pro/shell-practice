#!/bin/bash

echo "All variables passed to the script: $@"
echo "All variables passed to the script: $*"
echo "Script name: $0"
echo "Current directory: $pwd"
echo "who is running this: $USER"
echo "Home directory of user: $HOME"
echo "PID f this script: $$"
sleep 50 &
echo "PID of the last command in background is: $!"