#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "error: invalid number of arguments given"
    echo "usage: ./startmc.sh <version> <username>"
    exit
fi

version=$1
mc_home="$HOME/.minecraft"
mc_jar="$mc_home/versions/$version/$version.jar"
lib_dir="$mc_home/libraries"

username=$2
access_token="0"

if [ ! -f "$mc_jar" ]; then
    echo "error: version $version is not installed"
    exit
fi

cp="$mc_jar"
for jar in $(find "$lib_dir" -name "*.jar"); do

    # the fabric mc libraries present in my libs folder seemed to interfere with the classpath, so remove them
    # if you happen to have other libs that are not required for the version you are attempting to run, uncomment the block below and add the libraries there
    if [[ "$jar" == *fabricmc* || "$jar" == *net/fabricmc* ]]; then
        continue
    fi
    #if [[ "$jar" == *ipsum* || "$jar" == *lorem/ipsum* ]]; then
    #    continue
    #fi
    
    cp="${cp}:${jar}"
done

echo "info: running minecraft version $version as user $username"

java -cp $cp net.minecraft.client.main.Main --username $username --accessToken $access_token --version $version --gameDir $mc_home --assetsDir "$mc_home/assets" --userType mojang --versionType release

exit
