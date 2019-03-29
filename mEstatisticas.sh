#!/bin/bash
clear
echo "1) Alunos"
echo "2) Professores"
echo "3) Universidades"
echo "4) Disciplinas"
echo "5) Quit"
read opt
    case $opt in
        1)  ./esEstudante.sh
            ./mEstatisticas.sh;;
        2)  ./esProfessor.sh
            ./mEstatisticas.sh;;
        3)  ./esUniversidade.sh
            ./mEstatisticas.sh;;
        4)  ./esDisciplina.sh 
            ./mEstatisticas.sh;;
        5)
            clear;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'       # Evitar outros inputs não existentes no menu
            read rand
            echo $'\n'
            clear
            ./mEstatisticas.sh;;
    esac