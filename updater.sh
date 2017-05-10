#!/bin/bash
declare -i keepgoing=1
read -p "What do you want to update? (a-i) " update
file="LibreELEC-S905.arm-8.0-8.0.1$update.img"
while [ $keepgoing  -eq 1 ]
do
file="LibreELEC-S905.arm-8.0-8.0.1$update.img"
echo " "
echo "Checking for file $file"
echo " "
if [ -f ./$file ]
	then
		 echo "Sweet, I found it"
		echo
else
	echo "$file was not found."
	printf "\nEnding Script Here :(\n"
exit
fi

oldlower=$update
newlower=$(echo "$oldlower" | tr "0-9a-z" "1-9a-z_")

oldupper=$(echo $oldlower | awk '{print toupper($0)}')
newupper=$(echo $newlower | awk '{print toupper($0)}')
#echo $old $new

echo "Updating Revision '$oldupper' to Revsion '$newupper'."
echo
read -p "Do you wish to continue? (y/n)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
newfile="LibreELEC-S905.arm-8.0-8.0.1$newlower.img"
echo 
to="TO"
echo
echo "Upgrading from $file to $newfile"
xdelta3 -d -s $file LibreELEC-S905.arm-8.0-8.0.1-$oldupper-TO-$newupper $newfile
check=$(eval md5sum $newfile)
echo
echo "$check created....Done!"
echo 
read -p "Keep Going (y/n)" -n 1 -r
else 
printf "\nEnding Script Here :(\n"
fi
if [[ $REPLY =~ ^[Yy]$ ]]
then
 echo Okay.
 update=$newlower
  else
printf "\n\nEnding Script Here :(\n"
keepgoing=0
fi
done
