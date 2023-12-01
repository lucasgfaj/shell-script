#!/bin/bash

#Perguntando nome para o diretório
read -p "Informe um nome para seu diretório: " diretorio

#Criando diretório
mkdir "$diretorio"

#Confirmando a criação
echo "Diretório '$diretorio' criado com sucesso"

#Copiando conteúdo JSON
wget https://swapi.dev/api/people
mv people $diretorio

#Informando um termo a ser pesquisado
read -p "Informe um termo para ser pesquisar no arquivo: " termo

#Extraindo linhas para output.txt
jq [.] $diretorio/people | grep -i $termo  >> $diretorio/output.txt
cat $diretorio/output.txt

#Buscando seção (objeto) JSON
read -p "Informe uma seção que você deseja ver: " secao
jq '.$secao' people
#Extraindo a informação da seção buscada JQ

#Pergutando ao usuário qual valor ele gostaria de ver

#Exibindo o valor na tela

#Criando um novo arquivo JSON com o conteúdo desta seção totalmente alterada

#Criar 5 cópias deste novo arquivo
