#!/bin/bash
clear
dados="dados.txt"
echo "1) NºAlunos"
echo "2) NºAlunos por semestre"
echo "3) Quit"
read opt
    case $opt in
        1)  clear
            echo 'Número de Alunos Inscritos :'
            awk '($1+0)>=20000 && ($1+0)<=29999' dados.txt | wc -l             # Pesquisar valores dentro do intervalo
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./esEstudante.sh;;
        2)  
            clear
            echo "Semestre:"
            read semestre
            if [ $semestre -eq 1 ] || [ $semestre -eq 2 ] ;                     # Evitar escolhas que não sejam 1 ou 2
            then 
                clear
                echo "Número de alunos inscritos no semestre $semestre"
                grep -o ":$semestre:" $dados |  wc -l  
            else
                clear
                 echo "Semestre não encontrado! Tente outra vez!"    
            fi    
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./esEstudante.sh;;
        3)  clear
            ./mEstatisticas.sh;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'           # Evitar outros inputs no existentes não menu
            read rand
            echo $'\n'
            clear
            ./esEstudante.sh;;
    esac
