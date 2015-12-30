#!/bin/bash

if [ ! $# -eq 1 ]
then
    echo "Usage $0 <md5file>"
    exit 0
fi

source config.sh
infile="$1"
outdir="$mediatex_datadir"
logdir="$mediatex_logdir"

# 18/12/2015 arret a 21063 Photos/Pictures/2015/03/12/DSC_0918.JPG MediaTeX/data/000021063
# logfile="$logdir/copyToMediaTex.log"
# num=$(find "$outdir" -type f | wc -l)
# numcheck=$(wc -l "$logfile")
# if [ ! "$num" -eq "$numcheck" ]
# then
#    echo "ERROR: There are $num files in $outdir, but $numcheck lines in $logfile. Numbers should match. Abort"
#    exit 1
# fi

awk '{$1=""; print $0}' $infile | while read i; do
    ((num++))
    padded_num=$(printf '%09d' $num)
    echo "$i" "$outdir/$padded_num" >> "$logfile"
    cp -u "$i" "$outdir/$padded_num"
 done
