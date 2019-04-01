#!/bin/bash
clear
dados="dados.txt"
cod=$1
echo "1) Nome"
echo "2) Semestre"
echo "3) Sair"
read opt
    case $opt in

        1) 
            echo $'Introduza um novo nome:\n'
            read nome
            while grep $nome <<< $(grep '#' $dados) ;
            do
                echo $'Introduza um nome diferente:\n'
                read nome
            done
            nomeAntigo=$(grep $1 $dados | cut -d '#' -f 2)
            sed -i 's/'"#$nomeAntigo"'/'"#$nome"'/g' $dados #altera o nome da disciplina no registo da mesma
            sed -i 's/'":$nomeAntigo"'/'":$nome"'/g' $dados #altera o nome da disciplina nos registos dos alunos
            ;;

        2)  
            sem=$(grep $cod $dados | cut -d '#' -f 3) #semestre atual
            nome=$(grep $cod $dados | cut -d '#' -f 2) #procura o nome da mesma
            if [ $sem -eq 1 ]
            then
                sem=2
                sed -i 's/'"$nome#1"'/'"$nome#2"'/g' $dados #altera para o semestre contrário
            else
                sem=1
                sed -i 's/'"$nome#2"'/'"$nome#1"'/g' $dados #altera para o semestre contrário
            fi
            nome=$(grep $cod $dados | cut -d '#' -f 2) #procura o nome da mesma
            sed -i 's/'":$nome"'/'""'/g' $dados #remove a mesma do registo do aluno, já que não está incluída nesse semestre
            ;;

        3)  exit
            ;;

        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mEditar.sh;;

    esac