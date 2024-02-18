#!/bin/sh

for FILE in destool_snap_*png ; do
  BASE=$(basename $FILE .png)
  echo ============= processing $BASE
  convert -scale 75%  $BASE.png  ${BASE}_75.png
done;

