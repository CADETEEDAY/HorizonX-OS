#!/bin/bash
# Inicializa o repositório da Base da ROM (LineageOS como exemplo base estável AOSP)
# Recomendado rodar este script em uma pasta vazia onde ficará o código da ROM!

echo "Configurando git identity (Mude para o seu email se necessário)"
git config --global user.email "customrom@example.com"
git config --global user.name "CustomRomBuilder"

ROM_DIR="~/android_source"
echo "Criando diretório $ROM_DIR..."
mkdir -p $ROM_DIR
cd $ROM_DIR

echo "Inicializando o código fonte (LineageOS v20 / Android 13 para referência)..."
~/.bin/repo init -u https://github.com/LineageOS/android.git -b lineage-20.0

echo "Copiando o manifesto do POCO X4 Pro 5G para o framework do repo..."
mkdir -p .repo/local_manifests
cp /mnt/c/Users/CadeteV/.gemini/antigravity/scratch/PocoX4ProROM/local_manifests/veux.xml .repo/local_manifests/

echo "Iniciando o download massivo (+- 100GB a 200GB). Vá tomar um café bem demorado!"
# O -j8 define o uso de 8 threads de download simultâneas.
~/.bin/repo sync -c -j8 --force-sync --no-clone-bundle --no-tags
