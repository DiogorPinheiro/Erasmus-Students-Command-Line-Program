#!/bin/bash
clear
dados="dados.txt"
cod=$1
echo "1) Nome"
echo "2) País"
read opt
    case $opt in

        1) 
            clear
            echo $'Introduza um novo nome:\n'
            read nome
            while grep $nome $dados ;
            do
                echo $'Introduza um nome diferente:\n'
                read nome
            done
            pais=$(grep $cod $dados | cut -d @ -f 3)
            grep -v $cod $dados > tmp1.txt
            echo "$cod@$nome@$pais" >> tmp1.txt
            sort -n tmp1.txt > $dados
            rm tmp1.txt
            ;;

        2) 
            clear
            echo $'Introduza um novo país:\n'
            read pais
            nome=$(grep $cod $dados | cut -d @ -f 2)
            grep -v $cod $dados > tmp1.txt
            echo "$cod@$nome@$pais" >> tmp1.txt
            sort -n tmp1.txt > $dados
            rm tmp1.txt
            ;;

        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mEditar.sh;;

    esac