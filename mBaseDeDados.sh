#!/bin/bash
clear
dados="dados.txt"
dadosbak="dados.bak"
echo "1) Backup"
echo "2) Restaurar Backup"
echo "3) Apagar Backup"
echo "4) Sair para o Menu Principal"
read opt
    case $opt in
        1)
            if [ -f "$dados" ]
            then
                    cat dados.txt > dados.bak
                    echo $'\nBack efetuado com sucesso.'
            else   
                    echo $'\nNão existe ficheiro de dados. Criando...\n'
                    touch dados.txt
            fi
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mBaseDeDados.sh;;
        2)
            if [ -f "$dados" ]
            then
                    if [ -f "$dadosbak" ]
                    then
                            cat $dadosbak > $dados
                            echo $'\nBackup restaurado.'
                    else
                            echo $'\nNão existe ficheiro de backup.\n'
                    fi
            else
                    if [ -f "$dadosbak" ]
                    then
                            cat $dadosbak > dados.txt
                            echo $'\nBackup restaurado.'
                    else
                            echo $'\nNão existe ficheiro de dados nem de backup. Criando ficheiro de dados...'
                            touch dados.txt
                    fi
            fi
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mBaseDeDados.sh;;
        3)
            if [ -f "$dadosbak" ]
            then   
                    rm $dadosbak
                    echo $'\nBackup removido com sucesso.'
            else
                    echo $'\nNão existe backup. Impossível remover.'
            fi
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mBaseDeDados.sh;;
        4)
            echo $'\n'
            clear
            ./mPrincipal.sh;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mBaseDeDados.sh;;
    esac