# minecraft-launcher-sh
script to launch installed minecraft version jars from the command line

This script enables the user, to run already downloaded minecraft version jars from the command line. This is useful, if big evil corp decided to lock down your minecraft account because you did not want to give them your phone number (neither the end-user license agreement, nor the general ms TOS state it as required, but cleverly done, you imbeciles). It is also useful if you want to test server plugins locally with multiple users (your account is in offline mode anyways, unless you succeed in generating a valid session id).

# usage
The versions need to be installed through the minecraft launcher and must have been ran at least once to install all necessary files (actually, I don't know if that is even necessary. unless the version server has an api that requires a valid session id for downloading, it should be doable). Then, the `startmc.sh` file can be ran from the terminal. As of now, the version, username and so on can be changed by overwriting the variables in the shell script. I plan on adding user arguments to make that easier.
