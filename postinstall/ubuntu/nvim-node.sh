sudo apt-get install -y \
  curl

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | zsh
source ~/.zshrc

# nvm list-remote

#install node latest
nvm install lts/fermium

#node -v

#Update NPM
npm install -g npm@latest

sudo npm install -g neovim
