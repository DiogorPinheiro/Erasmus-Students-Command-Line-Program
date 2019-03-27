#!/bin/bash
clear
dados="dados.txt"
echo "1) Estudante"
echo "2) Professor"
echo "3) Universidade"
echo "4) Disciplina"
echo "5) Quit"
read opt
    case $opt in
        1)  
            clear
            if grep : $dados ;
            then   
                echo $'\nSelecione o aluno que pretende editar, introduzindo o código correspondente:\n'
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
        2)  ./edProfessor.sh
            ./mEditar.sh;;
        3)  ./edUniversidade.sh
            ./mEditar.sh;;
        4)  ./edDisciplina.sh 
            ./mEditar.sh;;
        5)
            clear;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mPrincipal.sh;;
    esac