# Usage: ./install_hooks.sh

FILES="src/*"

GIT_DIR=$(git rev-parse --git-dir)
HOOKS_DIR=$( cd -- "${GIT_DIR}/hooks" && pwd )

for f in $FILES
do
  echo "Installing $f file..."

  ln -s $( realpath $f ) $HOOKS_DIR
done

echo "Hooks installed"
