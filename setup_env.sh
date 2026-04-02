#!/bin/bash
# Prepara um ambiente Ubuntu limpo para compilação Android.

echo "Atualizando pacotes e instalando dependências base..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32readline-dev lib32z1-dev libelf-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev python3 libncurses-dev python-is-python3

echo "Instalando o 'repo' (Ferramenta do Google para gerenciar múltiplos Git)"
mkdir -p ~/.bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo
chmod a+x ~/.bin/repo

# Adicionando ~/bin ao PATH temporariamente
export PATH=~/.bin:$PATH

echo "Configuração inicial concluída. Execute source ~/.profile se o repo não for encontrado."
