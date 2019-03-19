#!/bin/bash
#Changes
PS3='Escolha: '
options=("Registo/Editar" "Alterar Dados" "Visualizar Dados" "Relatórios" "Gestão do(s) ficheiro(s) da Base de Dados" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Registo/Editar")
            PS3='Escolha:'
            options=("Universidade" "Professor" "Estudante" "Disciplina" "Sair para o Menu Principal")
            select opt in "${options[@]}"
            do  
                case $opt in    
                    "Universidade")
                        ;;
                    "Professor")
                        ;;
                    "Estudante")
                        ;;
                    "Disciplina")
                        ;; 
                    "Sair para o Menu Principal")
                        break;;
                    *) echo "Opção inválida $REPLY";;
                esac
            done;;
        "Alterar Dados")
            ;;
        "Visualizar Dados")
            ;;
        "Relatórios")
            PS3='Escolha:'
            options=("Listar Universidades" "Listar Disciplinas" "Listar Alunos Erasmus" "Listar Disciplinas com Alunos Inscritos" "Sair para o Menu Principal")
            select opt in "${options[@]}"
            do  
                case $opt in    
                    "Listar Universidades")
                        ;;
                    "Listar Disciplinas" )
                        ;;
                    "Listar Alunos Erasmus" )
                        ;;
                    "Listar Disciplinas com Alunos Inscritos")
                        ;; 
                    "Sair para o Menu Principal")
                        break;;
                    *) echo "Opção inválida $REPLY";;
                esac
            done;;
        "Gestão do(s) ficheiro(s) da Base de Dados") 
            PS3='Escolha:'
            options=("Backup" "Restaurar Backup" "Apagar Backup" "Sair para o Menu Principal")
            select opt in "${options[@]}"
            do  
                case $opt in    
                    "Backup")
                        ;;
                    "Restaurar Backup" )
                        ;;
                    "Apagar Backup" )
                        ;;
                    "Sair para o Menu Principal")
                        break;;
                    *) echo "Opção inválida $REPLY";;
                esac
            done;;
        "Quit")
            exit;;
            
        *) echo "Opção inválida $REPLY";;
    esac
done