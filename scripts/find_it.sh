#!/bin/sh
HEADER="______ _____ _   _ _____    _____ _______ 
|  ____|_   _| \ | |  __ \  |_   _|__   __|
| |__    | | |  \| | |  | |   | |    | |   
|  __|   | | | . \` | |  | |   | |    | |   
| |     _| |_| |\  | |__| |  _| |_   | |   
|_|    |_____|_| \_|_____/  |_____|  |_|"
echo "$HEADER\n"
UID_FINDIT=$(w | awk 'NR==3' | awk '{print $1}')
read -p  'Enter file to search :' FILENAME
if [ -z "$FILENAME" ];
then 
    echo "Please enter valid file name:"; 
fi;
read -p  'Specify path : ' MYPATH
echo "Results for $MYPATH"
BASE_PATH="${MYPATH:0:1}"
if [ $MYPATH == '/' ];
    then
        find / -name $FILENAME > test.txt
        clear
        echo "$HEADER"
fi;
if [ $BASE_PATH == '~' ];
    then
        if [ ${MYPATH:(-1)} == '/' ];
            then
                find /Users/$UID_FINDIT/${MYPATH:2} -name $FILENAME > test.txt
                clear
                echo "$HEADER"
                cat test.txt | nl
        else
                find /Users/$UID_FINDIT/$MYTHPATH/ -name $FILENAME > test.txt
                clear
                echo "$HEADER"
                cat test.txt | nl
        fi;
else 
    find $MYPATH/ -name "$FILENAME" > test.txt
    clear
    echo "$HEADER"
    cat test.txt | nl
fi;
read -p 'Which file number do you want to edit ?' FILENUMBER
CUSTOMPATH=$(cat test.txt | awk "NR==$FILENUMBER")
rm -rf test.txt
vim $CUSTOMPATH
