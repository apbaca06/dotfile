#!/bin/sh

if [ ! -d ~/.oh-my-zsh ]

then

    echo "=> Installing oh-my-zsh ..."

    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install)"

fi


if [ -d "$HOME/.dotfiles" ]; then

    echo "=> dotfiles is already installed in $HOME/.dotfiles, trying to update"

    echo "=> "

    cd "$HOME"/.dotfiles && git pull

else

    echo "=> clone dotfiles from Github..."

    git clone https://github.com/apbaca06/dotfile.git "$HOME"/.dotfiles

    cd "$HOME"/.dotfiles || exit

fi

echo ""


sh "$HOME"/.dotfiles/brew.sh
sh "$HOME"/.dotfiles/pip.sh
sh "$HOME"/.dotfiles/bootstrap.sh
