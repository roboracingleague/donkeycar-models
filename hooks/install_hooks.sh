# Usage: ./install_hooks.sh

# Copy or symlink hooks to the repository
cp -rf "./src/*" ".git/hooks"
echo "Hooks installed”
