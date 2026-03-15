#!/bin/bash

set -e

# error(){
#     echo "There is an error in $LINENO, Command is: $BASH_COMMAND"
# }
trap 'echo "There is an error in $LINENO, Command is: $BASH_COMMAND"' ERR
echo "Hello..."
echo "Before error.."
cccccccccccccccc:dng # here shell understands there is an erroor and signal is ERR
echo "After error"

