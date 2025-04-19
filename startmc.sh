version="1.20.4"
mc_home="$HOME/.minecraft"
mc_jar="$mc_home/versions/$version/$version.jar"
lib_dir="$mc_home/libraries"

username="test"
access_token="0"

cp="$mc_jar"
for jar in $(find "$lib_dir" -name "*.jar"); do
    if [[ "$jar" == *fabricmc* || "$jar" == *net/fabricmc* ]]; then
        continue
    fi
    cp="${cp}:${jar}"
done

java -cp $cp net.minecraft.client.main.Main --username $username --accessToken $access_token --version $version --gameDir $mc_home --assetsDir "$mc_home/assets" --userType mojang --versionType release

exit
