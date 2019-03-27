#!/bin/bash
clear
echo "1) Estudante"
echo "2) Professor"
echo "3) Universidade"
echo "4) Disciplina"
echo "5) Quit"
read opt
    case $opt in
        1)  ./edEstudante.sh
            ./mEditar.sh;;
        2)  ./edProfessor.sh
            ./mEditar.sh;;
        3)  ./edUniversidade.sh
            ./mEditar.sh;;
        4)  ./edDisciplina.sh 
            ./mEditar.sh;;
        5)
            clear;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mPrincipal.sh;;
    esac