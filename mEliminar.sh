#!/bin/bash
clear
echo "1) Estudante"
echo "2) Professor"
echo "3) Universidade"
echo "4) Disciplina"
echo "5) Quit"
read opt
    case $opt in
        1)  ./elEstudante.sh
            ./mEditar.sh;;
        2)  ./elProfessor.sh
            ./mEditar.sh;;
        3)  ./elUniversidade.sh
            ./mEditar.sh;;
        4)  ./elDisciplina.sh 
            ./mEditar.sh;;
        5)
            clear;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mPrincipal.sh;;
    esac