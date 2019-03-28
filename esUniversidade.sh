#!/bin/bash
clear
dados="dados.txt"
echo "1) NºUniversidades"
echo "2) Alunos por universidade"
echo "3) Quit"
read opt
    case $opt in
        1)  clear
            echo 'Número de Universidades Registadas :'
            awk '($1+0)>=10000 && ($1+0)<=19999' dados.txt | wc -l
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./esUniversidade.sh;;
        2)  clear
            echo 'Coloque ID da Universidade'
            read ID
            clear
            nome=$(grep $ID $dados| cut -d @ -f 2)
            echo "Nº de alunos associados inscritos na universidade $nome"
            valor=$(grep -o "$nome:" $dados |  wc -l)
            echo $valor            
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./esUniversidade.sh;;
        3)  clear
            ./mEstatisticas.sh;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mUniversidade.sh;;
    esac
