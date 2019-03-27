#!/bin/bash
clear
dados="dados.txt"
cod=$1
nomeAntigo=$(grep $cod $dados | cut -d : -f 2) # Procurar o nome antigo para apresentar como, para mais tarde, substituir pelo novo com o sed

    echo $'Se, a qualquer altura, pretender sair do programa, pressione CTRL+c.\nEstá a editar o aluno '$nomeAntigo'.\n'
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
                while [ $Cuniversidade -gt 19999 ] || [ $Cuniversidade -lt 10000 ] || [ "$(grep $Cuniversidade $dados | cut -d @ -f 1 )" -eq 1 ] ;
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
                while [ $Cprof -gt 49999 ] || [ $Cprof -lt 40000 ] || [ "$(grep $Cprof $dados | cut -d , -f 1 )" -eq 1 ] ;
                do
                    clear
                    grep , $dados
                    echo $'\nEscolha um código existente.\n'
                    read Cprof
                done

                nome=$(grep $Cprof $dados | cut -d , -f 3)
                nomeAntigo=$(grep $cod $dados | cut -d , -f 3)
                sed -i 's/'"$nomeAntigo"'/'"$nome"'/g' $dados
                echo $'\n'
                ./edEstudante $cod;;
            
            7)
                exit

            *)  echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
                read rand
                echo $'\n'
                clear
                ./edEstudante.sh $cod;;
    esac