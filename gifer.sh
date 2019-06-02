#!/bin/bash

infolder="in/"
outfolder="out/"

echo -n "Enter output file name: "
read outputfile
echo -n "Enter delay (in ms): "
read delay
echo -n "Enter resize (in %): "
read resize

echo ...reformatting image file names...
for ppfp in ${infolder}*.png; do 
	ppf=${ppfp%.png}
	pf=${ppf#${infolder}}
	f=$((10#$pf))
	
	#echo `printf %05d ${f}`

	mv $ppfp ${infolder}`printf %05d ${f}`.png
done
echo ...done...

echo ...converting to gif...
convert -resize ${resize}% -delay $delay -loop 0 ${infolder}*.png $outfolder${outputfile}
echo ...done...