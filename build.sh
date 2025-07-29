#!/bin/bash


## Welcome to the best tasting spagetti code ever.
## It's really weird but I love shell script now! It's like cuddling a blåhaj :3
## You need one package to run this, zip.
## Install zip by doing the "thing", in my case it's "sudo pacman -S zip".
## If you needed my help installing zip then you should (probably) not be here.
## as this is a DEV script for making zip files with .minecraft
## btw the only thing that takes time is zip compressing the file lol.



                       ##To disable zip when testing the script.
testing_mode=false

if ! $testing_mode; then
    echo "NOTE: Test mode is active: zip won't be used which means no compiled zip."
fi

                ## Version selection
echo What version of the build is this? type below:

read version

echo ""
echo Checking possible overrides...


                ## Checking if there already is a file with that version.
for x in ./builds/*
do
    filename=${x%%".zip"*}
    if [ "${filename##*"_v"}" = "$version" ]; then
        echo "ERROR: That version is already used!, move or delete the file with the version: $version" 
        exit 1
    fi
done

echo ""

echo prepping...


                ## Making temporary build directory
rm -rf ./Clovers-Modpack_v$version
mkdir ./Clovers-Modpack_v$version

echo moving files around...


                ## Copying dot-minecraft files to temporary build directory.
for i in ./dot-minecraft/*
do
    cp -r $i ./Clovers-Modpack_v$version
done



                ##Zipping
if ! $testing_mode; then
    echo zipping... MAKE SURE YOU HAVE ZIP INSTALLED!!!
    zip -r Clovers-Modpack_v$version.zip ./Clovers-Modpack_v$version

    echo ""
    echo zipped!!, cleaning..

                    ## Cleaning workspace
    mv Clovers-Modpack_v$version.zip ./builds/
fi

rm -rf ./Clovers-Modpack_v$version

echo ""
echo Done :3