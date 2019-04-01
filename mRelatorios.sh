#!/bin/bash
clear
echo "1) Listar Universidades"
echo "2) Listar Disciplinas"
echo "3) Listar Alunos Erasmus"
echo "4) Listar Professores"
echo "5) Sair para o Menu Principal"
read opt
    case $opt in
        1)
            clear
            echo 'Lista de Universidades:'
            echo $'\nID@Universidade@País\n'
            sed -n '/@/'p dados.txt
            echo $'\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            ./mRelatorios.sh;;
        2)
            clear
            echo 'Lista de Disciplinas:'
            echo $'\nID#Nome#Semestre\n'
            sed -n '/#/'p dados.txt
            echo $'\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            ./mRelatorios.sh;;
        3)
            clear
            echo 'Lista de Alunos:'
            echo $'\nID:Nome:Universidade:Professor:Semestre:Ano:Disciplinas\n'
            sed -n '/:/'p dados.txt
            echo $'\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            ./mRelatorios.sh;;
        
        4)
            clear
            echo 'Lista de Professores:'
            echo $'\nID,Nome\n'
            sed -n '/,/'p dados.txt
            echo $'\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            ./mRelatorios.sh;;
        5)
            echo $'\n'
            ./mPrincipal.sh;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            ./mRelatorios.sh;;
    esac