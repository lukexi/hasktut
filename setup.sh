# Make sure we've got homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we've got stack
curl -sSL https://get.haskellstack.org/ | sh

brew install sdl2

stack build
