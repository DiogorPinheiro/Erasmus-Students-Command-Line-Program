#!/bin/bash
clear
id=0
    echo 'Se pretender voltar atrás a qualquer altura basta pressionar CTRL+d.'
    echo 'Insira nome do professor'
    read nome

    while grep "$nome" dados.txt ;  # Verificar se nome colocado já existe na base de dados
    do
        clear
        echo $'Professor já se apresenta na base de dados.'
        read nome
    done

    if grep , dados.txt     # Atribuir ID ( Último ID registado + 1)
    then
        clear
        id=$(grep , dados.txt | tail -1 | cut -d : -f 1)
        id=$(($id + 1)) 
    else
        id=40000
    fi
    clear

    echo "$id,$nome" >> dados.txt     # Armazenar dados na base de dados
    sort -n dados.txt > tmp.txt
    mv tmp.txt dados.txt