#/bin/bash
#Script for copy, remove, rename or linking in linux machine
#Author: Vinod.N K
#Usage: multiple filemanagement task
#Distro : Linux -Centos, Rhel, and any fedora
#Check whether root user is running the script
  if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
  fi
#Lets start...  
echo "Select an option from copy , remove , rename , linking"
#read in user input into the action variable

answer=yes
while [ "$answer" = yes ]
do
read action

# if action is copy then continue proceed with the following
if [ $action = "copy" ]
then
echo "Please enter the filename you wish to copy"
read filename
# check if filename exists, if it doesn't then exit program
    if [ ! -e  $filename ] 
    then
    echo "$filename does not exist"
    exit 1
    fi
echo "Please enter the new filename"
read filenamenew
cp $filename $filenamenew
echo "$filename has been copied to $filenamenew"

# if action is remove then continue proceed with the following
elif [ $action = "remove" ]
then
echo "Please enter the filename you wish to remove"
read filename
# check if filename exists, if it doesn't then exit program
    if [ ! -e  $filename ] 
    then
    echo "$filename does not exist"
    exit 1
    fi
rm -rf $filename
echo "$filename has been deleted"

# if action is rename then continue proceed with the following
elif [ $action = "rename" ]
then
echo "Please enter the filename you wish to rename"
read filename
# check if filename exists, if it doesn't then exit program
    if [ ! -e  $filename ] 
    then
    echo "$filename does not exist"
    exit 1
    fi
echo "Please enter the new filename"
read filenamenew
mv $filename $filenamenew
echo "$filename has been renamed to $filenamenew"
fi

echo "Do you want to perform another file operation (yes/no) ?"
read answer

if [ "$answer" = yes ]
then "run script again"
fi

done

echo "Exiting Program"
exit 0
