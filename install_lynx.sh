#!/bin/bash


#Check if docker is installed
if ! type docker >/dev/null 2>&1; then
  echo "Install requires Docker to build"
  exit 1
fi
#Run docker build of doom-emacs
docker build -t lynx -t qwertimer/lynx .

## Check if user wants to add the lynx docker alias

if [ -f ~/.bashrc-personal ]; then 
    if grep "lynx()" ~/.bashrc-personal
    then
       echo "function already exists" 
    else 
        echo "lynx function will be added to ~/.bashrc-personal"
        echo "#lynx docker container" >> ~/.bashrc-personal
        echo "lynx() {docker run -it --rm qwertimer/lynx:latest}" >> ~/.bashrc-personal
    fi
else
    echo "bashrc-personal doesn't exist adding it now"
    echo "Adding bashrc-personal as an extension to current bashrc"

    echo -n > ~/.bashrc-personal
    
    echo "#lynx docker container" >> ~/.bashrc-personal
    echo "lynx() {docker run -it --rm qwertimer/lynx:latest}" >> ~/.bashrc-personal
fi



## Check if user wants to add the duck, google and bing aliases
 #### Add duck alias
    if grep "'?'=duck" ~/.bashrc-personal
    then
       echo "alias already exists" 
    else
        echo "duck alias will be added to ~/.bashrc-personal"
        echo "#duck, google and bing aliases for use with lynx" >> ~/.bashrc-personal       
        echo "alias '?'=duck" >> ~/.bashrc-personal
    fi 
   #### Add google alias
    if grep "'??'=google" ~/.bashrc-personal
    then
       echo "alias already exists" 
    else
       echo "google alias will be added to ~/.bashrc-personal"
       echo "alias '??'=google" >> ~/.bashrc-personal
    fi
   #### Add bing alias
    if grep "'???'=bing" ~/.bashrc-personal
    then
       echo "alias already exists" 
    else
       echo "bing alias will be added to ~/.bashrc-personal"
       echo "alias '???'=bing" >> ~/.bashrc-personal
    fi

