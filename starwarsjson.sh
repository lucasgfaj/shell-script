#!/bin/bash

#Perguntando nome para o diretório
read -p "Informe um nome para seu diretório: " diretorio

#Criando diretório
mkdir "$diretorio"

#Confirmando a criação
echo "Diretório '$diretorio' criado com sucesso"

#Entrando no diretório
cd $diretorio

#Copiando conteúdo JSON
curl -o $arquivo.json https://swapi.dev/api/people

#Informando um termo a ser pesquisado
read -p "Informe um termo para ser pesquisar no arquivo: " termo

jq [.] people

grep -i "$termo" "$diretorio/$arquivo.json" >>


#Extraindo Linhas para output.txt

#Buscando seção (objeto) JSON

#Extraindo a informação da seção buscada JQ

#Pergutando ao usuário qual valor ele gostaria de ver

#Exibindo o valor na tela

#Criando um novo arquivo JSON com o conteúdo desta seção totalmente alterada

#Criar 5 cópias deste novo arquivo
