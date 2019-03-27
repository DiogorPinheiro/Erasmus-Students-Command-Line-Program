#!/bin/bash
clear
id=0
dados="dados.txt"
    echo 'Se pretender voltar atrás a qualquer altura basta pressionar CTRL+c.'
    echo 'Insira nome do professor'
    read nome

    while grep "$nome" $dados ;  # Verificar se nome colocado já existe na base de dados
    do
        clear
        echo $'Professor já se apresenta na base de dados.'
        read nome
    done

    if grep , $dados     # Atribuir ID ( Último ID registado + 1)
    then
        clear
        id=$(grep , $dados | tail -1 | cut -d , -f 1)
        id=$(($id + 1)) 
    else
        id=40000
    fi
    clear

    echo "$id,$nome" >> $dados     # Armazenar dados na base de dados
    sort -n $dados > tmp.txt
    mv tmp.txt $dados