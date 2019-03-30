#!/bin/bash
clear
id=0
dados="dados.txt"
    echo 'Se pretender voltar atrás a qualquer altura basta pressionar CTRL+c.'
    echo 'Insira o nome do aluno: '
    read nome

    while grep "$nome" $dados ;  # Verificar se nome colocado já existe na base de dados
    do
        clear
        echo $'Aluno já se apresenta na base de dados. Introduza um novo nome'
        read nome
    done

    if grep : $dados ;   # Atribuir ID ( Último ID registado + 1)
    then
        clear
        id=$(grep : $dados | tail -1 | cut -d : -f 1)
        id=$(($id + 1)) 
    else
        id=20000
    fi
    clear
    echo $'Escolha o código de uma das universidades.\n'
    if grep @ $dados;
    then
            echo $'\nSe não pretender nenhuma destas e/ou querer criar uma nova pressione -1 a qualquer altura desta parte.\n'
            read cod
            while [ $cod -gt 19999 ] || [ $cod -lt 10000 ] || [ "$(grep -c $cod $dados)" -ne 1 ] ;
            do
                clear
                if [ $cod -eq -1 ]
                then
                    ./regUniversidade.sh
                fi
                grep @ $dados
                echo $'\nEscolha um código existente.\n'
                read cod
            done

    else
        clear
        echo $'\nNão existem universidades no ficheiro, deseja criar uma? [y/n]'
        read ans
        if [ $ans = "y" ] || [ $ans = "yes" ] || [ $ans = "Y" ] || [ $ans = "YES" ] || [ $ans = "yEs" ] || [ $ans = "yES" ] || [ $ans = "yeS" ] || [ $ans = "Yes" ] || [ $ans = "YeS" ] || [ $ans = -1 ] ;
        then
            ./regUniversidade.sh
            grep @ $dados
            read cod
            while [ $cod -gt 19999 ] || [ $cod -lt 10000 ] || [ "$(grep -c $cod $dados)" -ne 1 ] ;
            do
                clear
                if [ $cod -eq -1 ]
                then
                    ./regUniversidade.sh
                fi
                grep @ $dados
                echo $'\nEscolha um código existente.'
                read cod
            done
        else
            echo $'\nPressione [ENTER] para continuar.\n\n'
            read rand
            exit
        fi
    fi
    universidade=$(grep $cod $dados | cut -d @ -f 2)

    clear
    echo $'\nEscolha o código do professor desejado.\n'
    if grep , $dados;
    then    
            echo $'\nCaso não exista o professor desejado pressione -1 para criar.\n'
            read cod
            while [ $cod -gt 49999 ] || [ $cod -lt 40000 ] || [ "$(grep -c $cod $dados)" -ne 1 ] ;
            do
                clear
                if [ $cod -eq -1 ]
                then
                    ./regProfessor.sh
                fi
                grep , $dados
                echo $'\nEscolha um código existente.\n'
                read cod
            done
    else
        clear
        echo $'\nNão existem professores no ficheiro, deseja criar um registo? [y/n]'
        read ans
        if [ $ans = "y" ] || [ $ans = "yes" ] || [ $ans = "Y" ] || [ $ans = "YES" ] || [ $ans = "yEs" ] || [ $ans = "yES" ] || [ $ans = "yeS" ] || [ $ans = "Yes" ] || [ $ans = "YeS" ] || [ $ans = -1 ] ;
        then
            ./regProfessor.sh
            grep , $dados
            read cod
            while [ $cod -gt 49999 ] || [ $cod -lt 40000 ] || [ "$(grep -c $cod $dados)" -ne 1 ] ;
            do
                clear
                if [ $cod -eq -1 ]
                then
                    ./regProfessor.sh
                fi
                grep , $dados
                echo $'\nEscolha um código existente.'
                read cod
            done
        else
            echo $'\nPressione [ENTER] para continuar.\n\n'
            read rand
            exit
        fi
    fi
    professor=$(grep $cod $dados | cut -d , -f 2)

    clear
    echo $'\nEm que semestre vai frequentar a UBI? [1/2]\n'
    read sem
    while [ $sem -lt 1 ] || [ $sem -gt 2 ];
    do
        clear
        echo $'\nEscolha um semestre válido. [1/2]\n'
        read sem
    done

    #tempS=$(grep $nome $dados | cut -d : -f 5)
    #tempA=$(grep $nome $dados | cut -d : -f 6)
    #if [ $tempS -eq $sem ] && [ $tempA -eq $ano ]
    #then
    #    echo $'\nAluno já se encontra registado no mesmo ano e semestre'
    #fi
    clear
    echo $'\nEm que ano vai frequentar a UBI?\n'
    read ano
    anoAtual=$(date +%Y)
    mesAtual=$(date +%m)
    while [ $anoAtual -gt $ano ]
    do
        clear
        echo $'\nEscolha um ano válido, ou seja, maior ou igual a '
        echo "$anoAtual"
        echo $'\n'
        read ano
    done
    
    clear
    echo $'\nSó pode frequentar, no máximo, 8 disciplinas por semestre. Quantas deseja frequentar?\n'
    read nDisc
    while [ $nDisc -gt 8 ] || [ $nDisc -lt 1 ]
    do
        clear
        echo $'\nSó pode frequentar, no máximo, 8 disciplinas por semestre. Quantas deseja frequentar?\n'
        read nDisc
    done

    verificacao=() #array que vai armazenar o código de cada disciplina para não adicionar disciplinas repetidas no mesmo registo
    while [ $nDisc -ne 0 ]
    do
        clear
        flag=-1             #flag associada ao semestre da disciplina que o utilizador escolheu, esta altera entre 0 (disciplina corresponde ao mesmo semestre que o utilizador pretende frequentar), -1 (valor inicial para entrar no ciclo) e -2 (disciplina não corresponde ao mesmo semestre que o utilizador pretende frequentar) 
        flagD=-1            #flag associada à disciplina que está a ser adicionada, para certificar que não é repetida. Entra a -1, 0 corresponde a não repetida e -2 corresponde a repetida
        if grep '#' $dados;
        then
            clear
            echo $'\nSelecione uma disciplina introduzindo o código da mesma. Se pretender criar alguma introduza -1.\n'
            grep '#' $dados
            read cod
            echo "Lala"
            while [ $flag -lt 0 ] || [ $flagD -lt 0 ] ;
            do
                if [ $flag -eq -2 ] || [ $flagD -eq -2 ] ;
                then
                    clear
                    echo "Escolha uma disciplina associada ao semestre que deseja frequentar e que não esteja repetida."
                fi
                while [ $cod -gt 39999 ] || [ $cod -lt 30000 ] || [ "$(grep -c $cod $dados)" -ne 1 ] || [ $flag -eq -2 ] || [ $flagD -eq -2 ] ;
                do
                    if [ $cod -eq -1 ]
                    then
                        ./regDisciplina.sh
                    fi
                    grep "#" $dados
                    echo $'\nEscolha um código existente e de uma disciplina não repetida.'
                    read cod
                    for i in "${!verificacao[@]}" ;
                    do
                        if [ $cod -eq ${verificacao[$i]} ]
                        then
                            flagD=-2
                            i=-1
                            break
                        fi
                    done
                    i=$(($i+1))
                    if [ ${#verificacao[@]} -eq 0 ]
                    then
                        flagD=0
                    else
                        if [ $i -eq ${#verificacao[@]} ]
                        then
                            flagD=0 
                        fi
                    fi
                    temp=$(grep $cod $dados | cut -d '#' -f 3)
                    if [ $temp -ne $sem ]
                    then
                        flag=-2
                    else
                        flag=0
                    fi
                    clear
                done
                for i in "${!verificacao[@]}" ;
                do
                    if [ $cod -eq ${verificacao[$i]} ]
                    then
                        flagD=-2
                        i=-1
                        break
                    fi
                done
                i=$(($i+1))
                if [ ${#verificacao[@]} -eq 0 ]
                then
                    flagD=0
                else
                    if [ $i -eq ${#verificacao[@]} ]
                    then
                        flagD=0 
                    fi
                fi
                temp=$(grep $cod $dados | cut -d '#' -f 3)
                if [ $temp -ne $sem ]
                then
                    flag=-2
                else
                    flag=0
                fi
            done
        else
            clear
            echo $'\nNão existem disciplinas no ficheiro, deseja criar um registo? [y/n]\nOBS: Podem ser criadas mais disciplinas se introduzir -1'
            read ans
            if [ $ans = "y" ] || [ $ans = "yes" ] || [ $ans = "Y" ] || [ $ans = "YES" ] || [ $ans = "yEs" ] || [ $ans = "yES" ] || [ $ans = "yeS" ] || [ $ans = "Yes" ] || [ $ans = "YeS" ] || [ $ans = -1 ] ;
            then
                ./regDisciplina.sh
                echo $'\nSelecione uma disciplina introduzindo o código da mesma. Se pretender criar alguma introduza -1.\n'
                grep '#' $dados
                read cod
                while [ $flag -lt 0 ] || [ $flagD -lt 0 ] ;
                do
                    if [ $flag -eq -2 ] || [ $flagD -eq -2 ] ;
                    then
                        clear
                        echo "Escolha uma disciplina associada ao semestre que deseja frequentar e que não esteja repetida."
                    fi
                    while [ $cod -gt 39999 ] || [ $cod -lt 30000 ] || [ "$(grep -c $cod $dados)" -ne 1 ] || [ $flag -eq -2 ] || [ $flagD -eq -2 ];
                    do

                        if [ $cod -eq -1 ]
                        then
                            ./regDisciplina.sh
                        fi
                        clear
                        grep "#" $dados
                        echo $'\nEscolha um código existente.'
                        read cod
                        for i in "${!verificacao[@]}" ;
                        do
                            if [ $cod -eq ${verificacao[$i]} ]
                            then
                                flagD=-2
                                i=-1
                                break
                            fi
                        done
                        i=$(($i+1))
                        if [ ${#verificacao[@]} -eq 0 ]
                        then
                            flagD=0
                        else
                            if [ $i -eq ${#verificacao[@]} ]
                            then
                                flagD=0 
                            fi
                        fi
                        temp=$(grep $cod $dados | cut -d '#' -f 3)
                        if [ $temp -ne $sem ]
                        then
                            flag=-2
                        else
                            flag=0
                        fi
                        clear
                    done

                    for i in "${!verificacao[@]}" ;
                    do
                        if [ $cod -eq ${verificacao[$i]} ]
                        then
                            flagD=-2
                            i=-1
                            break
                        fi
                    done
                    i=$(($i+1))
                    if [ ${#verificacao[@]} -eq 0 ]
                    then
                        flagD=0
                    else
                        if [ $i -eq ${#verificacao[@]} ]
                        then
                            flagD=0 
                        fi
                    fi
                                    
                    temp=$(grep $cod $dados | cut -d '#' -f 3)
                    if [ $temp -ne $sem ]
                    then
                        flag=-2
                    else
                        flag=0
                    fi

                done
            else
                echo $'\nPressione [ENTER] para continuar.\n\n'
                read rand
                exit
            fi
        fi
        verificacao+=($cod)
        if [ $nDisc -ne 1 ]
        then
            disciplinas=":$(grep $cod $dados | cut -d '#' -f 2)${disciplinas}"
        else
            disciplinas="$(grep $cod $dados | cut -d '#' -f 2)${disciplinas}"
        fi
        nDisc=$(($nDisc-1))
    done

    echo "$id:$nome:$universidade:$professor:$sem:$ano:$disciplinas" >> $dados
    sort -n $dados > tmp.txt
    mv tmp.txt $dados
