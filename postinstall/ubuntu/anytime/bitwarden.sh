#!/bin/bash
REPO_VERSION=$(npm view @bitwarden/cli version)
LOCAL_VERSION=$(bw --version)

NEWER_VERSION=$(printf "${REPO_VERSION}\n${LOCAL_VERSION}" | sort -rV | head -n1)

if [[ "$NEWER_VERSION" != "$LOCAL_VERSION" ]]; then
  npm install -g @bitwarden/cli@$NEWER_VERSION
fi
