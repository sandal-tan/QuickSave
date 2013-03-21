#!/bin/sh

#  newFolder.sh
#  
#
#  Created by Ian Baldwin on 3/19/13.
#
COUNTER2=$(find /QuickSave/* -type d | grep -vcE 'Icon|Illustrator|PNG|Shell|Text|Word')
let COUNTER2=COUNTER2+1
volNum2='0'
ls -p /QuickSave/ | grep -v / > /tmp/FileName.txt
find /QuickSave/* -type d | grep -vE 'Icon|Illustrator|PNG|Shell|Text|Word' > /tmp/newFolder.txt

until [  "$volNum2" -eq "$COUNTER2" ]; do
fileCopy2=$(sed -n "$volNum2"p /tmp/FileName.txt)
fileType2=$(sed -n "$volNum2"p /tmp/newFolder.txt)
echo $fileCopy2
echo $fileType2
echo $volNum2
if [[ "${fileType2}" == *"${fileCopy2}"* ]]; then
mv /QuickSave/$fileCopy2 $fileType2/$fileCop
fi
let volNum2=volNum2+1
done
