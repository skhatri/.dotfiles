#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing .tilde environment..."

ZSHRC="$HOME/.zshrc"
touch "$ZSHRC"

if ! grep -q "source $DIR/functions.sh" "$ZSHRC"; then
    echo "" >> "$ZSHRC"
    echo "# .tilde setup" >> "$ZSHRC"
    echo "source $DIR/functions.sh" >> "$ZSHRC"
    echo "Added functions.sh to $ZSHRC"
fi

if ! grep -q "source $DIR/aliases.sh" "$ZSHRC"; then
    echo "source $DIR/aliases.sh" >> "$ZSHRC"
    echo "Added aliases.sh to $ZSHRC"
fi

if ! grep -q "source $DIR/prompt.zsh" "$ZSHRC"; then
    echo "source $DIR/prompt.zsh" >> "$ZSHRC"
    echo "Added prompt.zsh to $ZSHRC"
fi

GITCONFIG="$HOME/.gitconfig"
if [ -e "$GITCONFIG" ] && [ ! -L "$GITCONFIG" ]; then
    echo "Backing up existing ~/.gitconfig to ~/.gitconfig.bak..."
    mv "$GITCONFIG" "$GITCONFIG.bak"
fi

if [ ! -e "$GITCONFIG" ]; then
    echo "Symlinking .tilde/.gitconfig to ~/.gitconfig..."
    ln -s "$DIR/.gitconfig" "$GITCONFIG"
else
    echo "~/.gitconfig is already symlinked."
fi

VIMRC="$HOME/.vimrc"
if [ -e "$VIMRC" ] && [ ! -L "$VIMRC" ]; then
    echo "Backing up existing ~/.vimrc to ~/.vimrc.bak..."
    mv "$VIMRC" "$VIMRC.bak"
fi

if [ ! -e "$VIMRC" ]; then
    echo "Symlinking .tilde/.vimrc to ~/.vimrc..."
    ln -s "$DIR/.vimrc" "$VIMRC"
else
    echo "~/.vimrc is already symlinked."
fi

if ! grep -q "source $DIR/exports.sh" "$ZSHRC"; then
    echo "source $DIR/exports.sh" >> "$ZSHRC"
    echo "Added exports.sh to $ZSHRC"
fi

echo "Configuring global gitignore..."
git config --global core.excludesfile "$DIR/.gitignore_global"


echo "Installation complete! Please run 'source ~/.zshrc' or open a new terminal for the changes to take effect."
