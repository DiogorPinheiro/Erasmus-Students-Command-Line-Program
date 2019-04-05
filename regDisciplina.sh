#!/bin/bash
clear
id=0
dados="dados.txt"

    echo 'Se pretender voltar atrás a qualquer altura basta pressionar CTRL+c.'
    echo 'Coloque o semestre:'
    read semestre
    while [ $semestre -gt 2 ] || [ $semestre -lt 1 ];
    do
        clear
        echo $'Introduza 1 ou 2.\n'
        read semestre
    done
    clear
    echo 'Insira nome da disciplina'
    read nome
    clear
    while [ $(grep "$nome" <<< $(grep '#' $dados) | cut -d '#' -f 3) -eq $semestre ] ;  # Verificar se nome colocado já existe na base de dados
    do
            clear
            echo ""$nome" já se apresenta na base de dados, no mesmo semestre. Para alterar o semestre insira -1."
            read rand
            if [ $rand -eq -1 ]
            then
                clear
                echo "Insira um semestre diferente."
                read semestre
                while [ $semestre -lt 1 ] || [ $semestre -gt 2 ] ;
                do
                    clear
                    echo "Insira 1 ou 2."
                    read semestre
                done
            else
                nome="$rand"
            fi
    done

    if grep '#' $dados     # Atribuir ID ( Último ID registado + 1)
    then
        clear
        id=$(grep '#' $dados | tail -1 | cut -d '#' -f 1)
        id=$(($id + 1)) 
    else
        id=30000
    fi

    echo "$id#$nome#$semestre" >> $dados     # Armazenar dados na base de dados
    sort -n $dados > tmp.txt
    mv tmp.txt $dados