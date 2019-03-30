#!/bin/bash
clear
echo "1) Alunos"
echo "2) Professores"
echo "3) Universidades"
echo "4) Disciplinas"
echo "5) Voltar"
read opt
    case $opt in
        1)  ./esEstudante.sh;;
        2)  ./esProfessor.sh;;
        3)  ./esUniversidade.sh;;
        4)  ./esDisciplina.sh;;
        5)
            echo $'\n'
            clear
            ./mPrincipal.sh;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'       # Evitar outros inputs não existentes no menu
            read rand
            echo $'\n'
            clear
            ./mEstatisticas.sh;;
    esac