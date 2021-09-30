#!/bin/bash

function line() {
 echo "----------------------------------------------------------------------------------------------------"
}

function emptyLine() {
    echo ""
}

function isInstalled() {
    if ! [ -x "$(command -v $1)" ]; then
        false
    else
        true
    fi
}

function installMessage() {
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    NC='\033[0m' # No Color 

    ten="          " 
    forty="$ten$ten$ten$ten" 
    y="[$2]"
    y="${y:0:40}${forty:0:$((40 - ${#y}))}"

    if isInstalled $1; then
        echo -e "${y}${GREEN}Installed${NC}"
    else
        echo -e "${y}${RED}Failed${NC}"
    fi
}

function statusMessage() {
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    NC='\033[0m' # No Color 

    ten="          " 
    forty="$ten$ten$ten$ten" 
    y="[$1]"
    y="${y:0:40}${forty:0:$((40 - ${#y}))}"

    if $2; then
        echo -e "${y}${GREEN}Installed${NC}"
    else
        echo -e "${y}${RED}Failed${NC}"
    fi
}

# Load the Global Environment
source Config/global.env

cat << "EOF"
    __   _  __    __  ___            _ __            
   / /  | |/ /   /  |/  /___  ____  (_) /_____  _____
  / /   |   /   / /|_/ / __ \/ __ \/ / __/ __ \/ ___/
 / /___/   |   / /  / / /_/ / / / / / /_/ /_/ / /    
/_____/_/|_|  /_/  /_/\____/_/ /_/_/\__/\____/_/     
                                                     
EOF
echo "Version: ${LXMON_VERSION}"
line
emptyLine

# Message of the Day
sudo rm /etc/motd
sudo rm -r /etc/update-motd.d

sudo ln -s /home/lxma/LX-Monitor/Components/MOTD/motd /etc/motd
sudo ln -s /home/lxma/LX-Monitor/Components/MOTD/update-motd.d /etc/update-motd.d

echo "PrintLastLog" | sudo tee -a /etc/ssh/sshd_config

statusMessage MOTD true

# LXMON_PATH and Commands Bin
LXMonPath=`dirname "$(readlink -f "$0")"`
if [-f ~/.profile ]; then
    # Check for LX Mon Path
    if grep -Fxq "export LXMON_PATH=\"$LXMonPath\"" ~/.profile
    then
        statusMessage LXMon_Path true
    else
        echo "export LXMON_PATH=\"$LXMonPath\"" >> ~/.profile
        statusMessage LXMon_Path true
    fi

    # Commands
    if grep -Fxq 'export PATH="$LXMON_PATH/Components/Commands/Bin:$PATH"' ~/.profile
    then
        statusMessage Commands true
    else
        echo 'export PATH="$LXMON_PATH/Components/Commands/Bin:$PATH"' >> ~/.profile
        statusMessage Commands true
    fi

    # Aliases
    if grep -Fxq 'source $LXMON_PATH/Components/Commands/.aliases' ~/.profile
    then
        statusMessage Aliases true
    else
        echo 'source $LXMON_PATH/Components/Commands/.aliases' >> ~/.profile
        statusMessage Aliases true
    fi
else
    touch ~/.profile
    echo "export LXMON_PATH=\"$LXMonPath\"" >> ~/.profile
    echo 'export PATH="$LXMON_PATH/Components/Commands/Bin:$PATH"' >> ~/.profile
    echo 'source $LXMON_PATH/Components/Commands/.aliases' >> ~/.profile
    statusMessage LXMon_Path true
    statusMessage Commands true
    statusMessage Aliases true
fi

# Git
if ! isInstalled git; then
    sudo apt-get install git
fi
installMessage git Git

# Docker
if ! isInstalled docker; then
    curl -sSL https://get.docker.com | sh
fi
installMessage docker Docker

