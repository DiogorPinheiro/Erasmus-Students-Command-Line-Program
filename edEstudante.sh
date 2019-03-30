#!/bin/bash
clear
dados="dados.txt"
cod=$1
nomeAntigo=$(grep $cod $dados | cut -d : -f 2) # Procurar o nome antigo para apresentar como, para mais tarde, substituir pelo novo com o sed

    echo $'Se, a qualquer altura, pretender sair do programa, pressione CTRL+c.\nEstá a editar o aluno '$nomeAntigo'.'
    echo ""
    echo "1) Editar nome"
    echo "2) Editar universidade"
    echo "3) Editar professor responsável"
    echo "4) Editar semestre"
    echo "5) Editar ano"
    echo "6) Editar disciplinas"
    echo "7) Sair"
    read opt

        case $opt in

            1)  clear
                echo $'Introduza um nome diferente.'
                read nome
                while grep "$nome" $dados ;  # Verificar se nome colocado já existe na base de dados
                do
                    clear
                    echo $'Esse nome já se apresenta na base de dados. Introduza um novo nome'
                    read nome
                done
                sed -i 's/'"$nomeAntigo"'/'"$nome"'/g' $dados
                echo $'\n'
                ./edEstudante $cod;;
            2)  clear
                echo $'Introduza o código de uma universidade.\n'
                grep @ $dados
                read Cuniversidade
                while [ $Cuniversidade -gt 19999 ] || [ $Cuniversidade -lt 10000 ] || [ "$(grep -c $Cuniversidade $dados)" -ne 1 ] ;
                do
                    clear
                    grep @ $dados
                    echo $'\nEscolha um código existente.\n'
                    read Cuniversidade
                done
                nome=$(grep $Cuniversidade $dados | cut -d @ -f 3)
                nomeAntigo=$(grep $cod $dados | cut -d @ -f 3)
                sed -i 's/'"$nomeAntigo"'/'"$nome"'/g' $dados
                echo $'\n'
                ./edEstudante $cod;;
            3)  clear
                echo $'Introduza o código de um professor.\n'
                grep , $dados
                read Cprof
                while [ $Cprof -gt 49999 ] || [ $Cprof -lt 40000 ] || [ "$(grep -c $Cprof $dados)" -ne 1 ] ;
                do
                    clear
                    grep , $dados
                    echo $'\nEscolha um código existente.\n'
                    read Cprof
                done

                nome=$(grep $Cprof $dados | cut -d , -f 2)
                nomeAntigo=$(grep $cod $dados | cut -d , -f 2)
                rm tmp.txt
                grep $cod $dados > tmp.txt | sed -i 's/'"$nomeAntigo"'/'"$nome"'/g' tmp.txt
                grep -v $cod $dados > tmp1.txt
                cat tmp.txt >> tmp1.txt
                sort -n tmp1.txt > $dados
                rm tmp1.txt
                rm tmp.txt
                ./edEstudante $cod;;

            4)  clear
                echo $'\nAVISO! Se alterar o semestre associado a este registo vai perder todas as disciplinas associadas ao mesmo e vai ter que adicionar novas. Continuar? [y/n]'
                read ans
                if [ $ans = "y" ] || [ $ans = "yes" ] || [ $ans = "Y" ] || [ $ans = "YES" ] || [ $ans = "yEs" ] || [ $ans = "yES" ] || [ $ans = "yeS" ] || [ $ans = "Yes" ] || [ $ans = "YeS" ] || [ $ans = -1 ] ;
                then
                    universidade=$(grep $cod $dados | cut -d : -f 3)
                    ano=$(grep $cod $dados | cut -d : -f 6)
                    sem=$(grep $cod $dados | cut -d : -f 5)
                    professor=$(grep $cod $dados | cut -d : -f 4)
                    if [ $sem -eq 1 ]
                    then
                        sem=2
                    else
                        sem=1
                    fi
                    newvalue="${cod}:${nomeAntigo}:${universidade}:${professor}:${sem}:${ano}:"
                    
                    clear
                    echo $'\nSó pode frequentar, no máximo, 8 disciplinas por semestre. Quantas deseja frequentar?\n'
                    read nDisc
                    while [ $nDisc -gt 8 ] || [ $nDisc -lt 1 ] ;
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
                        
                            echo $'\nSelecione uma disciplina introduzindo o código da mesma. Se pretender criar alguma introduza -1.\n'
                            grep '#' $dados
                            read codDisc
                            while [ $flag -lt 0 ] || [ $flagD -lt 0 ] ;
                            do
                                if [ $flag -eq -2 ] || [ $flagD -eq -2 ] ;
                                then
                                    clear
                                    echo "Escolha uma disciplina associada ao semestre que deseja frequentar e que não esteja repetida."
                                fi
                                while [ $codDisc -gt 39999 ] || [ $codDisc -lt 30000 ] || [ "$(grep -c $codDisc $dados)" -ne 1 ] || [ $flag -eq -2 ] || [ $flagD -eq -2 ] ;
                                do
                                    if [ $codDisc -eq -1 ]
                                    then
                                        echo "1"
                                        ./regDisciplina.sh
                                    fi
                                    grep "#" $dados
                                    echo $'\nEscolha um código existente e de uma disciplina não repetida.'
                                    read codDisc
                                    for i in "${!verificacao[@]}" ;
                                    do
                                        if [ $codDisc -eq ${verificacao[$i]} ]
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
                                    temp=$(grep $codDisc $dados | cut -d '#' -f 3)
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
                                    if [ $codDisc -eq ${verificacao[$i]} ]
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
                                temp=$(grep $codDisc $dados | cut -d '#' -f 3)
                                if [ $temp -ne $sem ]
                                then
                                    flag=-2
                                else
                                    flag=0
                                fi
                            done
                        
                        verificacao+=($codDisc)
                        if [ $nDisc -ne 1 ]
                        then
                            disciplinas=":$(grep $codDisc $dados | cut -d '#' -f 2)${disciplinas}"
                        else
                            disciplinas="$(grep $codDisc $dados | cut -d '#' -f 2)${disciplinas}"
                        fi
                        nDisc=$(($nDisc-1))
                    done
                    newvalue="${newvalue}${disciplinas}"
                    grep -v $cod $dados > tmp.txt
                    echo "$newvalue" >> tmp.txt
                    sort -n tmp.txt > $dados
                    rm tmp.txt
                    ./edEstudante $cod
                else
                    clear
                    ./edEstudante.sh $cod
                fi
                ;;
            5)  
                clear
                echo $'\nEm que ano vai frequentar a UBI?\n'
                read ano
                anoAtual=$(date +%Y)
                while [ $anoAtual -gt $ano ]
                do
                    clear
                    echo $'\nEscolha um ano válido, ou seja, maior ou igual a '
                    echo "$anoAtual"
                    echo $'\n'
                    read ano
                done
                temp=$(grep $cod $dados | cut -d : -f 6)
                rm tmp.txt
                grep $cod $dados > tmp.txt | sed -i 's/'$temp'/'$ano'/g' tmp.txt
                grep -v $cod $dados > tmp1.txt
                cat tmp.txt >> tmp1.txt
                sort -n tmp1.txt > $dados
                rm tmp1.txt
                rm tmp.txt
                ./edEstudante $cod
                ;;

            6)  clear
                
                    universidade=$(grep $cod $dados | cut -d : -f 3)
                    ano=$(grep $cod $dados | cut -d : -f 6)
                    sem=$(grep $cod $dados | cut -d : -f 5)
                    professor=$(grep $cod $dados | cut -d : -f 4)
                    newvalue="${cod}:${nomeAntigo}:${universidade}:${professor}:${sem}:${ano}:"
                    
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
                        
                            echo $'\nSelecione uma disciplina introduzindo o código da mesma. Se pretender criar alguma introduza -1.\n'
                            grep '#' $dados
                            read codDisc
                            while [ $flag -lt 0 ] || [ $flagD -lt 0 ] ;
                            do
                                if [ $flag -eq -2 ] || [ $flagD -eq -2 ] ;
                                then
                                    clear
                                    echo "Escolha uma disciplina associada ao semestre que deseja frequentar e que não esteja repetida."
                                fi
                                while [ $codDisc -gt 39999 ] || [ $codDisc -lt 30000 ] || [ "$(grep -c $codDisc $dados)" -ne 1 ] || [ $flag -eq -2 ] || [ $flagD -eq -2 ] ;
                                do
                                    if [ $codDisc -eq -1 ]
                                    then
                                        ./regDisciplina.sh
                                    fi
                                    grep "#" $dados
                                    echo $'\nEscolha um código existente e de uma disciplina não repetida.'
                                    read codDisc
                                    for i in "${!verificacao[@]}" ;
                                    do
                                        if [ $codDisc -eq ${verificacao[$i]} ]
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
                                    temp=$(grep $codDisc $dados | cut -d '#' -f 3)
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
                                    if [ $codDisc -eq ${verificacao[$i]} ]
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
                                temp=$(grep $codDisc $dados | cut -d '#' -f 3)
                                if [ $temp -ne $sem ]
                                then
                                    flag=-2
                                else
                                    flag=0
                                fi
                            done
                        
                        verificacao+=($codDisc)
                        if [ $nDisc -ne 1 ]
                        then
                            disciplinas=":$(grep $codDisc $dados | cut -d '#' -f 2)${disciplinas}"
                        else
                            disciplinas="$(grep $codDisc $dados | cut -d '#' -f 2)${disciplinas}"
                        fi
                        nDisc=$(($nDisc-1))
                    done
                    newvalue="${newvalue}${disciplinas}"
                    grep -v $cod $dados > tmp.txt
                    echo "$newvalue" >> tmp.txt
                    sort -n tmp.txt > $dados
                    rm tmp.txt
                    ./edEstudante $cod
                ;;

            7)  
                exit;;

            *)  echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
                read rand
                echo $'\n'
                clear
                ./edEstudante.sh $cod;;
    esac