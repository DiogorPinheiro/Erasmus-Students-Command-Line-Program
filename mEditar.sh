#!/bin/bash
clear
dados="dados.txt"
echo "1) Estudante"
echo "2) Professor"
echo "3) Universidade"
echo "4) Disciplina"
echo "5) Voltar"
read opt
    case $opt in
        
        1)  clear
            if grep : $dados ;
            then   
                echo $'Selecione o aluno que pretende editar, introduzindo o código correspondente:\n'
                read cod
                    while [ $cod -gt 29999 ] || [ $cod -lt 20000 ] || [ "$(grep $cod $dados | cut -d : -f 1 )" -eq 1 ] ;
                    do
                        clear
                        grep : $dados
                        echo $'\nEscolha um código existente.\n'
                        read cod
                    done
            else
                clear
                echo $'Não existem alunos registados, impossível editar.\n\nPressione [ENTER] para voltar atrás.\n\n'
                read rand
                ./mEditar.sh
                exit
            fi
                       
            ./edEstudante.sh $cod
            ./mEditar.sh;;
        2)  
            clear
            if grep , $dados ;
            then   
                echo $'Selecione o professor que pretende editar, introduzindo o código correspondente:\n'
                read cod
                    while [ $cod -gt 49999 ] || [ $cod -lt 40000 ] || [ "$(grep $cod $dados | cut -d , -f 1 )" -eq 1 ] ;
                    do
                        clear
                        grep , $dados
                        echo $'\nEscolha um código existente.\n'
                        read cod
                    done
            else
                clear
                echo $'Não existem professores registados, impossível editar.\n\nPressione [ENTER] para voltar atrás.\n\n'
                read rand
                ./mEditar.sh
                exit
            fi
            clear
            nome=$(grep $cod $dados | cut -d , -f 2)
            echo "Pretende alterar o nome do professor '$nome'? [y/n] "
            if [ $ans = "y" ] || [ $ans = "yes" ] || [ $ans = "Y" ] || [ $ans = "YES" ] || [ $ans = "yEs" ] || [ $ans = "yES" ] || [ $ans = "yeS" ] || [ $ans = "Yes" ] || [ $ans = "YeS" ] || [ $ans = -1 ] ;
            then
                echo $'Introduza um novo nome:\n'
                read novo
                while grep "$nome" $dados ;  # Verificar se nome colocado já existe na base de dados
                do
                    clear
                    echo $'O professor já se apresenta na base de dados. Introduza um novo nome:'
                    read nome
                done
            else
                ./mEditar.sh
                exit
            fi
            nomeAntigo=$(grep $cod $dados | cut -d , -f 2)
            rm tmp.txt
            grep $cod $dados > tmp.txt | sed -i 's/'"$nomeAntigo"'/'"$nome"'/g' tmp.txt
            grep -v $cod $dados > tmp1.txt
            cat tmp.txt >> tmp1.txt
            sort -n tmp1.txt > $dados
            rm tmp1.txt
            rm tmp.txt
            ./mEditar.sh;;
        3)  
            clear
            if grep @ $dados ;
            then   
                echo $'Selecione a universidade que pretende editar, introduzindo o código correspondente:\n'
                read cod
                    while [ $cod -gt 19999 ] || [ $cod -lt 10000 ] || [ "$(grep $cod $dados | cut -d @ -f 1 )" -eq 1 ] ;
                    do
                        clear
                        grep @ $dados
                        echo $'\nEscolha um código existente.\n'
                        read cod
                    done
            else
                clear
                echo $'Não existem universidades registadas, impossível editar.\n\nPressione [ENTER] para voltar atrás.\n\n'
                read rand
                ./mEditar.sh
                exit
            fi
            ./edUniversidade.sh $cod
            ./mEditar.sh
            ;;
        4)  
            clear
            if grep '#' $dados ;
            then   
                echo $'Selecione a disciplina que pretende editar, introduzindo o código correspondente:\n'
                read cod
                    while [ $cod -gt 39999 ] || [ $cod -lt 30000 ] || [ "$(grep $cod $dados | cut -d '#' -f 1 )" -eq 1 ] ;
                    do
                        clear
                        grep '#' $dados
                        echo $'\nEscolha um código existente.\n'
                        read cod
                    done
            else
                clear
                echo $'Não existem disciplinas registadas, impossível editar.\n\nPressione [ENTER] para voltar atrás.\n\n'
                read rand
                ./mEditar.sh
                exit
            fi
            ./edDisciplina.sh $cod 
            ./mEditar.sh;;
        5)
            clear;;

        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mEditar.sh;;
    esac