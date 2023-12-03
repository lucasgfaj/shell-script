#!/bin/bash

# Perguntando nome para o diretório
read -p "Informe um nome para seu diretório: " diretorio

# Criando diretório
mkdir "$diretorio"

# Confirmando a criação
echo "Diretório '$diretorio' criado com sucesso"

# Copiando conteúdo JSON
wget -qO "$diretorio/people.json" https://swapi.dev/api/people

# Informando um termo a ser pesquisado
read -p "Informe um termo para ser pesquisar no arquivo: " termo

# Extraindo linhas para output.txt
jq --arg termo "$termo" '.results[] | to_entries[] | select(.value | tostring | contains($termo)) | {(.key): .value}' "$diretorio/people.json" > "$diretorio/output.txt"
cat "$diretorio/output.txt"

# Buscando seção (objeto) JSON
read -p "Informe uma seção que você deseja ver: " secao
jq --arg secao "$secao" '.results[] | select(.url == $secao)' "$diretorio/people.json" >> "$diretorio/output.txt"

cat "$diretorio/output.txt"
# Perguntando ao usuário qual valor ele gostaria de ver na seção
read -p "Informe o nome do valor que deseja ver na seção: " valor

# Exibindo o valor na tela
echo "Valor:  $valor"

# Criando um novo arquivo JSON com o conteúdo desta seção totalmente alterada
jq --arg valor "$valor" '.results[] | .name = $valor' "$diretorio/people.json" > "$diretorio/arquivo.json"

# Criar 5 cópias deste novo arquivo
for i in {1..5}; do
  cp "$diretorio/arquivo.json" "$diretorio/arquivo_$i.json"
done
