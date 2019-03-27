#!/bin/bash
clear
id=0
dados="dados.txt"
    echo 'Se pretender voltar atrás a qualquer altura basta pressionar CTRL+c.'
    echo 'Insira nome da disciplina'
    read nome

    while grep "$nome" $dados ;  # Verificar se nome colocado já existe na base de dados
    do
        clear
        echo $'Disciplina já se apresenta na base de dados.'
        read nome
    done

    if grep '#' $dados     # Atribuir ID ( Último ID registado + 1)
    then
        clear
        id=$(grep '#' $dados | tail -1 | cut -d '#' -f 1)
        id=$(($id + 1)) 
    else
        id=30000
    fi
    clear

    echo 'Coloque o semestre '
    read semestre

    echo "$id#$nome#semestre" >> $dados     # Armazenar dados na base de dados
    sort -n $dados > tmp.txt
    mv tmp.txt $dados