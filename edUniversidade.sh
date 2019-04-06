#!/bin/bash
clear
dados="dados.txt"
cod=$1
echo "1) Nome"
echo "2) País"
echo "3) Sair"
read opt
    case $opt in

        1) 
            clear
            echo $'Introduza um novo nome:\n'
            read nome
            while grep $nome $dados ;
            do
                echo $'Introduza um nome diferente:\n'
                read nome
            done
            nomeAntigo=$(grep $cod $dados | cut -d @ -f 2)
            sed -i 's/'":$nomeAntigo"'/'":$nome"'/g' $dados #altera todas as ocorrências do nome nos estudantes
            sed -i 's/'"@$nomeAntigo"'/'"@$nome"'/g' $dados #altera o nome da universidade
            ./edUniversidade.sh $cod;;

        2) 
            clear
            echo $'Introduza um novo país:\n'
            read pais
            nome=$(grep $cod $dados | cut -d @ -f 2)
            grep -v $cod $dados > tmp1.txt
            echo "$cod@$nome@$pais" >> tmp1.txt
            sort -n tmp1.txt > $dados
            rm tmp1.txt
            ./edUniversidade.sh $cod;;

        3)
            exit;;

        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./edUniversidade.sh $cod;;

    esac