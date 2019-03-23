#!/bin/bash
clear
echo "1) Listar Universidades"
echo "2) Listar Disciplinas"
echo "3) Listar Alunos Erasmus"
echo "4) Listar Disciplinas com Alunos Inscritos"
echo "5) Sair para o Menu Principal"
read opt
    case $opt in
        1)
            ;;
        2)
            ;;
        3)
            ;;
        4)
            ;;
        5)
            echo $'\n'
            clear
            ./mPrincipal.sh;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mRelatorios.sh;;
    esac