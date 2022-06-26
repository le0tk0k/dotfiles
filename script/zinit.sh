#!/bin/bash

set -eux

readonly ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"
if [[ -d "${ZINIT_HOME}" ]]; then
  echo "Zinit is already installed."
else
  echo "Installing Zinit..."
  mkdir -p "$(dirname "${ZINIT_HOME}")"
  git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_HOME}"
fi
