#!/bin/bash

# Request input params
read -p "Enter 'in directory [default: in/]: " infolder
infolder=${infolder:-"in/"}
read -p "Enter 'out' directory [default out/]: " outfolder
outfolder=${outfolder:-"out/"}
read -p "Enter image extension [default: .png]: " imgext
imgext=${imgext:-".png"}
read -p "Enter output file name [default: output.gif]: " outputfile
outputfile=${outputfile:-"output.gif"}
read -p "Enter delay (in ms) [default: 4]: " delay
delay=${delay:-"4"}
read -p "Enter resize (in %) [default: 100]: " resize
resize=${resize:-"100"}


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