#!/bin/bash
clear
id=0
    echo 'Se pretender voltar atrás a qualquer altura basta pressionar CTRL+c.'
    echo 'Insira nome da disciplina'
    read nome

    while grep "$nome" dados.txt ;  # Verificar se nome colocado já existe na base de dados
    do
        clear
        echo $'Disciplina já se apresenta na base de dados.'
        read nome
    done

    if grep '#' dados.txt     # Atribuir ID ( Último ID registado + 1)
    then
        clear
        id=$(grep '#' dados.txt | tail -1 | cut -d : -f 1)
        id=$(($id + 1)) 
    else
        id=30000
    fi
    clear

    echo 'Coloque o semestre '
    read semestre

    echo "$id#$nome#semestre" >> dados.txt     # Armazenar dados na base de dados
    sort -n dados.txt > tmp.txt
    mv tmp.txt dados.txt