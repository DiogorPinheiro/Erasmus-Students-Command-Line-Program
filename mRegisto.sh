#!/bin/bash
clear
echo "1) Universidade"
echo "2) Professor"
echo "3) Estudante"
echo "4) Disciplina"
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
        *) echo $'\n\nOpção inválida.\nPressione qualquer tecla para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mRegisto.sh;;
    esac