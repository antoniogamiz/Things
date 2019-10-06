#!/bin/bash 

# ================= confiuration vars =======================

TMP_DIR=/tmp/antonio

# ================= helper functions ========================

function DEBUG {
    echo -e "\e[32m========> $1 \e[0m"
}

function ERROR {
    echo -e "\e[31m [ERROR] $1 \e[0m"
}

# ===========================================================

DEBUG "Computer setup"

if [ -d $TMP_DIR ];
then
    ERROR "$TMP_DIR already exists. Please remove it"
    ERROR "or change TMP_DIR configuration variable."
    exit 1
else
    DEBUG "$TMP_DIR used for tmp files"
    mkdir $TMP_DIR
    cd $TMP_DIR
fi

# ===========================================================

DEBUG "Standard packages"
sudo apt-get install git curl
# TODO: configure git and autowrap with vim (set to 72)

# ===========================================================

DEBUG "Zsh"
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# ===========================================================

DEBUG "Visual Studio Code"
sudo apt install code

# ===========================================================

DEBUG "Python related"
sudo apt install python -y

# ===========================================================

DEBUG "Latex related" 
sudo apt install texlive-base
sudo apt install textlive-latex-recommended
sudo apt install texlive
sudo apt install texlive-latex-extra
sudo apt install texlive-full
