#!/usr/bin/env bash
set -e

echo "==> Atualizando repositórios e instalando dependências de compilação..."
sudo apt-get update
sudo apt-get install -y \
  bc bison build-essential ccache curl flex g++-multilib gcc-multilib \
  git git-lfs gnupg gperf imagemagick lib32readline-dev lib32z1-dev \
  libelf-dev liblz4-tool libncurses-dev libssl-dev libxml2 libxml2-utils \
  lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev \
  python3 python-is-python3 openjdk-11-jdk

# Criar links simbólicos para retrocompatibilidade com ncurses 5
sudo ln -sf /usr/lib/x86_64-linux-gnu/libncurses.so.6 /usr/lib/x86_64-linux-gnu/libncurses.so.5 2>/dev/null || true
sudo ln -sf /usr/lib/x86_64-linux-gnu/libtinfo.so.6 /usr/lib/x86_64-linux-gnu/libtinfo.so.5 2>/dev/null || true

# Instalar a ferramenta repo
echo "==> Instalando ferramenta repo..."
sudo curl --create-dirs -L -o /usr/local/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
sudo chmod a+rx /usr/local/bin/repo

# Configuração global do Git
echo "==> Configurando Git..."
git config --global user.name "HorizonX-OS Builder"
git config --global user.email "builder@horizonx-os.local"
git config --global color.ui true

echo "==> Ambiente configurado com sucesso!"
