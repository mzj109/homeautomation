#!/bin/bash
TMPDIR=temp/$$
. ~/code/shell/appenv
cd "$LOCAL_MEDIA"
mkdir -p $TMPDIR
cd $TMPDIR
echo "START downloading $1 to folder $TMPDIR"
youtube-dl --ignore-config --output "%(title)s-%(id)s.%(ext)s" $1
EXIT=$?
if [[ $EXIT -eq 0 ]]; then
 echo "COMPLETED downloading $1 `date`"
else
 echo "ERROR downloading $1 `date`"
 exit $EXIT
fi
DEST_FLDR=../../$2/
mkdir -p $DEST_FLDR
echo "moving $(ls) to $DEST_FLDR"
mv ./* $DEST_FLDR
cd $LOCAL_MEDIA
rmdir $TMPDIR

