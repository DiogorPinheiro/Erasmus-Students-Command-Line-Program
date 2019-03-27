#!/bin/bash
clear

echo "1) NºProfessores"
echo "2) Alunos por professor"
echo "3) Quit"
read opt
    case $opt in
        1)  clear
            echo 'Número de Professores Registados :'
            awk '($1+0)>=40000 && ($1+0)<=49999' dados.txt | wc -l
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./esProfessor.sh;;
        2)  clear
            echo 'Coloque ID do professor'
            read ID
            ./esProfessor.sh;;
        3)
            clear;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mPrincipal.sh;;
    esac





