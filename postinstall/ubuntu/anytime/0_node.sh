#!/bin/zsh
sudo apt-get install -y \
  curl

repo="nvm-sh/nvm"

source ~/.zshrc
REPO_VERSION=$(curl -s "https://api.github.com/repos/${repo}/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
LOCAL_VERSION=$(nvm --version)

NEWER_VERSION=$(printf "${REPO_VERSION}\n${LOCAL_VERSION}" | sort -rV | head -n1)
if [[ "$NEWER_VERSION" == "$LOCAL_VERSION" ]]; then
  echo same version skipping
else
  echo "repo $REPO_VERSION"
  echo "local $LOCAL_VERSION"
  curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v${NEWER_VERSION}/install.sh" | zsh
  source ~/.zshrc
fi
# exit



#install node latest
REPO_VERSION=$(nvm version-remote lts/fermium)
LOCAL_VERSION=$(node --version)

NEWER_VERSION=$(printf "${REPO_VERSION}\n${LOCAL_VERSION}" | sort -rV | head -n1)
if [[ "$NEWER_VERSION" == "$LOCAL_VERSION" ]]; then
  echo node same version skipping
else
  nvm install "$NEWER_VERSION"
  nvm use "$NEWER_VERSION"
  nvm uninstall "$LOCAL_VERSION"
fi


npminstalorupdate(){
  pkg=$1

  REPO_VERSION=$(npm view "$pkg" version)
  LOCAL_VERSION=$(npm list -g "$pkg" | grep -Po "$pkg@\K[0-9.]+")
  NEWER_VERSION=$(printf "${REPO_VERSION}\n${LOCAL_VERSION}" | sort -rV | head -n1)

  if [[ "$NEWER_VERSION" == "$LOCAL_VERSION" ]]; then
    echo $pkg same version skipping
    return
  else
    echo "updating ${pkg} $LOCAL_VERSION >>> $NEWER_VERSION"
    npm install -g "${pkg}@${NEWER_VERSION}"
  fi

}

#Update NPM"
npminstalorupdate npm
npminstalorupdate yarn
npminstalorupdate neovim

source ~/.zshrc
