#!/bin/bash
clear
dados="dados.txt"
echo "1) NºProfessores"
echo "2) Alunos por professor"
echo "3) Média de alunos por professor"
echo "4) Professor com mais alunos"
echo "5) Quit"
read opt
    case $opt in
        1)  
            clear
            echo 'Número de Professores Registados :'
            awk '($1+0)>=40000 && ($1+0)<=49999' dados.txt | wc -l
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./esProfessor.sh;;
        2)  
            clear
            echo 'Coloque ID do Professor'
            read ID
            clear
            nome=$(grep $ID $dados| cut -d , -f 2)
            echo "Nº de alunos associados ao professor(a) $nome"
            valor=$(grep -o "$nome:" $dados |  wc -l)
            echo $valor            
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./esProfessor.sh;;
        3)
            clear
            alunos=$(grep -c : $dados)
            profs=$(grep -c , $dados)
            echo "Média de alunos por professor"
            echo $((alunos/ profs))
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./esProfessor.sh;;
        4)
            clear
            
            ./esProfessor.sh;;        
        5)  clear
            ./mEstatisticas.sh;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mProfessor.sh;;
    esac





