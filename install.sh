#!/bin/bash

# sudo cp -a Ultimate-Maia-Black /usr/share/themes
# icon theme: oranchelo greenhttps://askubuntu.com/questions/37824/what-is-the-best-way-to-configure-a-thinkpads-trackpoint
# https://github.com/OrancheloTeam/oranchelo-icon-theme
# gnome theme: ultimate maia black

# snap windows to a corner
# https://askubuntu.com/questions/1048693/how-can-i-snap-a-window-in-a-corner-with-18-04https://askubuntu.com/questions/37824/what-is-the-best-way-to-configure-a-thinkpads-trackpoint

# setup sensibility in trackpointer thinkpad
# https://askubuntu.com/questions/37824/what-is-the-best-way-to-configure-a-thinkpads-trackpoint

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
sudo apt install vim -y
sudo apt install gnome-tweak-tool -y
sudo apt-get install git curl -y
git config --global core.editor "vim"
git config --global user.name "Antonio Gamiz"
git config --global user.email antoniogamiz10@gmail.com
# vim wrapping for commits to 72 characterrs
echo "autocmd FileType gitcommit set textwidth=72 \n autocmd FileType gitcommit set colorcolumn=73" >> .vimrc
# commit template
echo "# header"          >> ~/.gitmessage
echo ""                  >> ~/.gitmessage
echo "# why"             >> ~/.gitmessage
echo ""                  >> ~/.gitmessage
echo "References:"       >> ~/.gitmessage
echo "# Fix:"            >> ~/.gitmessage
echo "# Co-authored-by:" >> ~/.gitmessage
# set commit template
echo "[commit]"                         >> ~/.gitconfig
echo "        template = ~/.gitmessage" >> ~/.gitconfig

# ===========================================================

DEBUG "Zsh"
sudo apt-get install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# ===========================================================

DEBUG "Visual Studio Code"
sudo apt install code -y

# ===========================================================

DEBUG "Python related"
sudo apt install python -y
sudo apt install python-pip -y
sudo apt install python3-pip -y

# ===========================================================

DEBUG "Latex related"
sudo apt install texlive-base -y
sudo apt install textlive-latex-recommended -y
sudo apt install texlive -y
sudo apt install texlive-latex-extra -y
sudo apt install texlive-full -y

# =============================================================

DEBUG "Random"
sudo apt install terminator
sudo update-alternatives --config x-terminal-emulator
sudo apt install tree -y
sudo apt install docker.io -y
# see to add a shortcut https://github.com/lupoDharkael/flameshot/issues/200#issuecomment-388810822
# https://askubuntu.com/a/1039949/797072
sudo apt install flameshot -y

# ===============================================================
DEBUG "NodeJS"
sudo apt install nodejs -y
