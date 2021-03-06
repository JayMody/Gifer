#!/bin/bash

# Request input params
read -e -p "Enter 'in' directory: " -i "in/" infolder
read -e -p "Enter 'out' directory: " -i "out/" outfolder
read -e -p "Enter image extension: " -i ".png" imgext
read -e -p "Enter output file name: " -i "output.gif" outputfile
read -e -p "Enter delay (in ms): " -i "4" delay
read -e -p "Enter resize (in %): " -i "100" resize


# Reformat file names
echo ...reformatting image file names...

for ppf in ${infolder}*${imgext}; do # for each file ending in the image extension in the in folder
	pf=${ppf//[!0-9]/} # removes all non number values from filename
	f=$((10#$pf)) # removes any leading zeros
	#echo `printf %05d ${f}`
	mv $ppf ${infolder}`printf %05d ${f}`${imgext} # renames the image files to be in numerical order (leading 0's)
done

echo ...done...


echo ...converting to gif...
# imagemagick convert command that converts images to gif
convert -resize ${resize}% -delay $delay -loop 0 ${infolder}*${imgext} $outfolder${outputfile}
echo ...done...