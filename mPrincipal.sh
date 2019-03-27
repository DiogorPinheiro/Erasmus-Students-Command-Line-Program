#!/bin/bash
clear
echo "1) Registo/Editar"
echo "2) Alterar Dados"
echo "3) Visualizar Dados"
echo "4) Relatórios"
echo "5) Gestão do(s) ficheiro(s) da Base de Dados"
echo "6) Estatísticas"
echo "7) Quit"
read opt
    case $opt in
        1)  
            echo $'\n'
            clear
            ./mRegisto.sh;;
        2)  
            echo $'\n'
            clear
            ./mAltera.sh;;
        3)
            clear
            cat dados.txt
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mPrincipal.sh;;
        4)
            echo $'\n'
            clear
            ./mRelatorios.sh;;
        5)
            echo $'\n'
            clear
            ./mBaseDeDados.sh;;

        6)  echo $'\n'
            clear
            ./mEstatisticas.sh;;

        7)
            clear;;
        *)  echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mPrincipal.sh;;
    esac
#es lindo david :-*