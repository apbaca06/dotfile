#!/bin/sh

# change shell to zsh

if [ "$SHELL" != '/bin/zsh' ]; then

    echo "$SHELL"

    chsh -s /bin/zsh

fi


# main program

echo "=> This will install the files to: ${HOME}"

echo "=>"


# git config --global user.signingkey GPG_KEY

# git config --global user.email EMAIL

# git config --global user.name NAME

echo "=> Copying Git Configurations ..."

cp git/gitconfig ~/.gitconfig

cp git/git-global-ignore ~/.git-global-ignore

cp git/git-global-attributes ~/.git-global-attributes


which git-pr && rm "$(which git-pr)"  # Remove git-pr, which broken my alias `git pull --rebase`




echo "=> Copying Lekton fonts ..."

cp -rf font/Lekton/*ttf ~/Library/Fonts/




echo "=> Copying .zsh-theme ..."

echo 'source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

echo "=> Activating autosuggestions  ..."

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh plugin

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]

then

    echo "=> Installing zsh-syntax-highlighting ..."

    echo "=> "

    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

fi




if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]

then

    echo "=> Installing zsh-autosuggestions ..."

    echo "=> "

    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

fi

# cocoapods spec
if [ ! -d ~/.cocoapods/repos/master]

then

    echo "=> Installing cocoapods spec ..."

    echo "=> "

    git clone --depth=1 https://github.com/CocoaPods/Specs.git master

fi



echo

sw_vers

echo

brew --version

python2 --version

python3 --version

ruby --version

echo

echo "All done!"
