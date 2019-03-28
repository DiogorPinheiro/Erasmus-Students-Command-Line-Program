#!/bin/bash
clear
echo "1) Estudante"
echo "2) Professor"
echo "3) Universidade"
echo "4) Disciplina"
echo "5) Voltar"
read opt
    case $opt in
        1)  ./elEstudante.sh
            ./mEliminar.sh;;
        2)  ./elProfessor.sh
            ./mEliminar.sh;;
        3)  ./elUniversidade.sh
            ./mEliminar.sh;;
        4)  ./elDisciplina.sh 
            ./mEliminar.sh;;
        5)
            clear;;
        *)  echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mEliminar.sh;;
    esac