#!/bin/bash
clear
echo "1) Estudante"
echo "2) Professor"
echo "3) Universidade"
echo "4) Disciplina"
echo "5) Voltar"
read opt
    case $opt in
        1)  ./elEstudante.sh;;
        2)  ./elProfessor.sh;;
        3)  ./elUniversidade.sh;;
        4)  ./elDisciplina.sh;;
        5)
            echo $'\n'
            clear
            ./mAltera.sh;;
        *)  echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mEliminar.sh;;
    esac