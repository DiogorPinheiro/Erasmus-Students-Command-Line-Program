#!/bin/bash
clear
dados="dados.txt"
echo "1) NºDisciplinas"
echo "2) Alunos por Disciplina"
echo "3) Quit"
read opt
    case $opt in
        1)  clear
            echo 'Número de Disciplinas Registadas :'
            awk '($1+0)>=30000 && ($1+0)<=39999' dados.txt | wc -l
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./esDisciplinas.sh;;
        2)  clear
            echo 'Coloque ID da Disciplina'
            read ID
            clear
            nome=$(grep $ID $dados| cut -d '#' -f 2)
            echo "Nº de alunos associados à disciplina $nome"
            valor=$(grep -o ":$nome" $dados |  wc -l)
            echo $valor            
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./esDisciplinas.sh;;
        3)  clear
            ./mEstatisticas.sh;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./esDisciplinas.sh;;
    esac

