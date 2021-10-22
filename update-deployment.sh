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

cat << "EOF"
    __   _  __    __  ___            _ __            
   / /  | |/ /   /  |/  /___  ____  (_) /_____  _____
  / /   |   /   / /|_/ / __ \/ __ \/ / __/ __ \/ ___/
 / /___/   |   / /  / / /_/ / / / / / /_/ /_/ / /    
/_____/_/|_|  /_/  /_/\____/_/ /_/_/\__/\____/_/     
                                                     
EOF
line
echo "Updating Deployment..."
emptyLine
emptyLine

# Check for the upstream repo to pull changes from
if git remote show upstream; then
    echo "Upstream Confirmed"
else
    echo "Upstream missing, adding HyperLX Upstream"
    git remote add upstream git@github.com:hyperlighting/lx-monitor.git
    git remote set-url --push upstream DISABLED
fi

# Pull and merge changes
git fetch upstream
git rebase upstream/main

# Check what branch we are currently on
BRANCH=${git rev-parse --abbrev-ref HEAD}

if [ BRANCH == "main" ]; then
    git fetch upstream
    git rebase upstream/main
else if [ BRANCH == "develop" ]; then
    git fetch upstream
    git rebase upstream/develop
else
    echo "Current branch not supported"
    ecit 1
fi