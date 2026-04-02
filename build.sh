#!/bin/bash
# Script de compilação da ROM para o dispositivo veux

ROM_DIR="~/android_source"

cd $ROM_DIR

echo "Carregando as ferramentas de build na memória..."
source build/envsetup.sh

echo "Preparando o almoço para veux..."
# 'lunch' instrui as ferramentas de qual modelo iremos construir e que tipo de build (userdebug = com root shell ativado)
lunch lineage_veux-userdebug

echo "Iniciando compilação final (isso leva horas...)"
# 'mka' ou 'make -jX' inicia o GCC/Clang em todo o dispositivo
mka bacon
