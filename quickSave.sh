#!/bin/sh

#  loopTest.sh
#  
#
#  Created by Ian Baldwin on 3/18/13.
#
COUNTER=$(ls -p /QuickSave/ | grep -cv /)
COUNTER2=$(find /QuickSave/* -type d | grep -vcE 'Icon|Illustrator|PNG|Shell|Text|Word')
let COUNTER=COUNTER+1
let COUNTER2=COUNTER2+1
volNum='1'
volNum2='0'
ls -p /QuickSave/ | grep -v / > /tmp/FileName.txt
ls /QuickSave/ | grep -vE 'Icon|Illustrator|PNG|Shell|Text|Word' > /tmp/newFolder.txt
until [  "$volNum" -eq "$COUNTER" ]; do
fileCopy=$(sed -n "$volNum"p /tmp/FileName.txt)
if [[ "$fileCopy" == *.sh* ]]; then
fileType="Shell"
fi
if [[ "$fileCopy" == *.txt* ]]; then
fileType="Text"
fi
if [[ "$fileCopy" == *.ai* ]]; then
fileType="Illustrator"
fi
if [[ "$fileCopy" == *.icns* ]]; then
fileType="Icon"
fi
if [[ "$fileCopy" == *.ico* ]]; then
fileType="Icon"
fi
if [[ "$fileCopy" == *.docx* ]]; then
fileType="Word"
fi
if [[ "$fileCopy" == *.doc* ]]; then
fileType="Word"
fi
if [[ "$fileCopy" == *.png* ]]; then
fileType="PNG"
fi
mv /QuickSave/$fileCopy /QuickSave/$fileType/
let volNum=volNum+1
done
rm -rf /tmp/FileName.txt
rm -rf /tmp/newFolder.txt