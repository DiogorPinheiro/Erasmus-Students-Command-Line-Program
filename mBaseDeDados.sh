#!/bin/bash
clear
echo "1) Backup"
echo "2) Restaurar Backup"
echo "3) Apagar Backup"
echo "4) Sair para o Menu Principal"
read opt
    case $opt in
        1)
            ;;
        2)
            ;;
        3)
            ;;
        4)
            echo $'\n'
            clear
            ./mPrincipal.sh;;
        *) echo $'\n\nOpção inválida.\nPressione qualquer tecla para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mBaseDeDados.sh;;
    esac