# Add user npm global bin to PATH
if [ -d "$HOME/.local/share/npm-global/bin" ]; then
    export PATH="$HOME/.local/share/npm-global/bin:$PATH"
fi
