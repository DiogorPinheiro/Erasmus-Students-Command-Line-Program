#!/bin/bash
clear
id=0
echo 'Se pretender voltar atrás a qualquer altura basta pressionar CTRL+d.'
echo 'Insira o nome do aluno: '
read nome
id=$(grep : dados.txt | tail -1 | cut -d : -f 1)

    if [ $id -lt 20000 ]
    then
        id=20000
    fi

    clear
    echo $'\nEscolha o código de uma das universidades.\nSe não pretender nenhuma destas e/ou querer criar uma pressione -1 a qualquer altura desta parte.'
    if grep @ dados.txt;
    then
            grep @ dados.txt
            read cod
            while [ $cod -gt 19999 ] || [ $cod -lt 10000 ] || [ "$(grep $cod dados.txt )" -ne 1 ] ;
            do
                clear
                if [ $cod -eq 1 ]
                then
                    ./regUniversidade.sh
                fi
                grep @ dados.txt
                echo $'\nEscolha um código existente.'
                read cod
            done

    else
        clear
        echo $'\nNão existem universidades no ficheiro, deseja criar uma? [y/n]'
        read ans
        if [ $ans = "y" ] || [ $ans = "yes" ] || [ $ans = "Y" ] || [ $ans = "YES" ] || [ $ans = "yEs" ] || [ $ans = "yES" ] || [ $ans = "yeS" ] || [ $ans = "Yes" ] || [ $ans = "YeS" ] ;
        then
            ./regUniversidade.sh
            grep @ dados.txt
            read cod
            while [ $cod -gt 19999 ] || [ $cod -lt 10000 ] || [ "$(grep $cod dados.txt | cut -d @ -f 1 )" -eq 1 ] ;
            do
                clear
                if [ $cod -eq 1 ]
                then
                    ./regUniversidade.sh
                fi
                grep @ dados.txt
                echo $'\nEscolha um código existente.'
                read cod
            done
        else
            echo $'\nPressione [ENTER] para continuar.\n\n'
            read rand
        fi
        