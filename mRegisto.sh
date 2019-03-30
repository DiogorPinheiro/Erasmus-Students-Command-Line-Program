#!/bin/bash
clear
echo "1) Universidade"
echo "2) Professor"
echo "3) Estudante"
echo "4) Disciplina"
echo "5) Sair para o Menu Principal"
read opt
    case $opt in
        1)  ./regUniversidade.sh
            ./mRegisto;;
        2)  ./regProfessor.sh
            ./mRegisto;;
        3)  ./regEstudante.sh
            ./mRegisto;;
        4)  ./regDisciplina.sh
            ./mRegisto;;    
        5)
            echo $'\n'
            clear
            ./mPrincipal.sh;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mRegisto.sh;;
    esac