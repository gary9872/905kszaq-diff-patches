#!/bin/bash
#NEWIMAGEDIR=~/s905images
#mkdir -p $NEWIMAGEDIR

YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

ERROR="${YELLOW}\nEnding Script Here\n\n"
if [[ $EUID -eq 0 ]]; then
   echo
   echo "So you're a baller, running my very 'hack' script as ROOT!"
   echo "But don't complain if your whole computer dies a horrible , horrible death, because of it." 
   echo
   echo "Hit CTRL-C now if you have any sanity left.." 
 fi
declare -i keepgoing=1
echo
read -p "What Revision are we updating?  (a-i) " update
file="LibreELEC-S905.arm-8.0-8.0.1$update.img"
while [ $keepgoing  -eq 1 ]
do

file="LibreELEC-S905.arm-8.0-8.0.1$update.img"
echo " "
echo "Checking for file $file"
echo " "

if [ -f ./$file.gz ]
	then
	echo "I'm making a copy of $file.gz in its uncompressed form... "
	echo 
	gunzip -k $file.gz
	else
	echo
	fi

if [ -f ./$file ]
	then
		echo "Sweet, I have $file"
		echo
else
	echo "$file was not found."
	printf "$ERROR"
exit
fi



oldlower=$update
newlower=$(echo "$oldlower" | tr "0-9a-z" "1-9a-z_")

oldupper=$(echo $oldlower | awk '{print toupper($0)}')
newupper=$(echo $newlower | awk '{print toupper($0)}')

#Do we already have that revsion??

filerev=LibreELEC-S905.arm-8.0-8.0.1$newlower.img

if [ -f ./$filerev ]
	then
	echo
	echo "Hmm... I also already found revision $newupper"
	echo
	read -p "Do you want to overwrite it? " -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
		then
		echo
		echo "Removing $filerev"
		rm $filerev
		echo
		echo "Done!"
		else
		echo
		printf "$ERROR"
		exit
		fi
	else
	echo
	fi


#test for update
patchfile="LibreELEC-S905.arm-8.0-8.0.1-$oldupper-TO-$newupper"

if [ -f ./$patchfile ]
	then
	echo
	echo  "Patchfile found"
	echo
	else
	printf "${RED}Sorry I cannot find the patchfile named $patchfile ${NC}"
	echo
	printf "$ERROR"
	exit
	fi
echo "Updating Revision '$oldupper' to Revsion '$newupper'."
echo
read -p "Do you wish to continue? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
newfile="LibreELEC-S905.arm-8.0-8.0.1$newlower.img"
echo 
to="TO"
echo
echo "Updating from $file to $newfile"
patchfile="LibreELEC-S905.arm-8.0-8.0.1-$oldupper-TO-$newupper"
xdelta3 -d -s $file $patchfile $newfile
check=$(eval md5sum $newfile)
echo
printf "${GREEN}$check${NC} created....Done!"
echo
echo
read -p "Keep Going (y/n) " -n 1 -r
else
printf "$ERROR"
fi
if [[ $REPLY =~ ^[Yy]$ ]]
then
 echo
 echo Okay.
 update=$newlower
  else
printf "$ERROR"
keepgoing=0
fi
done
