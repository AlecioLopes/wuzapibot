#!/bin/bash
echo "##### ESTE PROCESSO PODE LEVAR DE 15 A 20 MINUTOS #####"

# Instalar Git e Go
echo "Instalando Git e Go..."
pkg install -y git golang &>/dev/null
echo "Git e Go foram instalados com sucesso."

# Clonar o repositório de WuzAPI
echo "Clonando o repositório do Layouts..."
git clone https://github.com/AlecioLopes/wuzapibot.git &>/dev/null
echo "Repositório clonado com sucesso."

# Navegar para o diretório do projeto
cd wuzapibot

# Compilar o binário do WuzAPI com o nome padrão
echo "Compilando o binário..."
go build .&>/dev/null

# Verificar se o binário foi compilado com sucesso
if [ -f "./wuzapi" ]; then
    echo "Layouts foi compilado com sucesso no Termux."
    
    # Conceder permissões de execução ao binário
    chmod +x wuzapi
    chmod +x executar_wuzapibot.sh

    echo "Permissões de execução concedidas ao Layouts."
else
    echo "Erro ao compilar o Layouts."
    exit 1
fi

# Concedendo permissões para o Tasker
mkdir -p ~/.termux && echo "allow-external-apps=true" >> ~/.termux/termux.properties

# Executar o Layouts
echo "Executando Layouts..."
./wuzapi
