#!/bin/bash
clear
echo "1) Listar Universidades"
echo "2) Listar Disciplinas"
echo "3) Listar Alunos Erasmus"
echo "4) Listar Disciplinas com Alunos Inscritos"
echo "5) Listar Professores"
echo "6) Sair para o Menu Principal"
read opt
    case $opt in
        1)
            clear
            echo 'Lista de Universidades:'
            echo 'ID:Universidade:País'
            sed -n '/@/'p dados.txt
            echo $'\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            ./mRelatorios.sh;;
        2)
            clear
            echo Lista de Disciplinas:
            sed -n '/#/'p dados.txt
            echo $'\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            ./mRelatorios.sh;;
        3)
            clear
            echo Lista de Alunos:
            sed -n '/:/'p dados.txt
            echo $'\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            ./mRelatorios.sh;;
        4)
            ;;
        5)
            clear
            echo Lista de Professores:
            sed -n '/,/'p dados.txt
            echo $'\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            ./mRelatorios.sh;;
        6)
            echo $'\n'
            ./mPrincipal.sh;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            ./mRelatorios.sh;;
    esac