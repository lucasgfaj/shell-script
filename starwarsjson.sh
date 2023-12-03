#!/bin/bash

#1. Perguntando nome para o diretório
read -p "Informe um nome para seu diretório: " diretorio

#1.1. Criando diretório
mkdir "$diretorio"

#1.2. Confirmando a criação
echo "Diretório '$diretorio' criado com sucesso"

#2. Copiando conteúdo JSON
wget https://swapi.dev/api/people
mv people $diretorio

#3. Informando um termo a ser pesquisado
read -p "Informe um termo para ser pesquisar no arquivo: " termo

#4. Extraindo linhas para output.txt
jq [.] $diretorio/people | grep -i $termo  >> $diretorio/output.txt
cat $diretorio/output.txt

#5. Buscando seção (objeto) JSON
read -p "Informe uma seção que você deseja ver: " secao

#6. Extraindo a informação da seção buscada JQ
jq ".results[$secao]" $diretorio/people >> $diretorio/output.txt
cat $diretorio/output.txt

#7. Perguntar ao usuário qual valor isolado desta seção ele gostaria de ver
read -p "Informe um valor isolado desta seção: " valor

#8. Exibir o valor isolado na tela
echo "O valor isolado escolhido é: $valor"

#9. Criando um novo arquivo JSON com o conteúdo desta seção totalmente alterada
jq ".results[$secao].$termo = \"$valor\"" $diretorio/people > $diretorio/alterado_arquivo.json
echo "Novo arquivo JSON criado com sucesso: $diretorio/alterado_arquivo.json"

#10. Criar 5 cópias deste novo arquivo
for i in {1..5}
do
    cp "$diretorio/alterado_arquivo.json" "$diretorio/people_copia_alterada$i"
done

#10.1 Conclusão
echo "Operações concluídas."
