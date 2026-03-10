#!/binn/bash

echo "Please enter the number"
read NUMBER

if [ $(($NUMBER % 2)) -wq 0 ]; then
    echo "Given number $NUMBER is EVEn"
else 
    echo "Given number $NUMBER is ODD"
fi        