#!/bin/bash
clear
dados="dados.txt"
cod=$1
echo "1) Nome"
echo "2) Semestre"
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
            sem=$(grep $cod $dados | cut -d '#' -f 3)
            grep -v $cod $dados > tmp1.txt
            echo "$cod#$nome#$sem" >> tmp1.txt
            sort -n tmp1.txt > $dados
            rm tmp1.txt
            ;;

        2)  
            sem=$(grep $cod $dados | cut -d '#' -f 3)
            if [ $sem -eq 1 ]
            then
                sem=2
            else
                sem=1
            fi
            nome=$(grep $cod $dados | cut -d '#' -f 2)
            grep -v $cod $dados > tmp1.txt
            echo "$cod#$nome#$sem" >> tmp1.txt
            sort -n tmp1.txt > $dados
            rm tmp1.txt
            ;;

        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mEditar.sh;;

    esac