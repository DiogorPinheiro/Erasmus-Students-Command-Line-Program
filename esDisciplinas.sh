#!/bin/bash
clear
dados="dados.txt"
echo "1) NºDisciplinas"
echo "2) Alunos por Disciplina"
echo "3) Quit"
read opt
    case $opt in
        1)  clear
            echo 'Número de Disciplinas Registadas :'
            awk '($1+0)>=30000 && ($1+0)<=39999' dados.txt | wc -l # Pesquisar valores dentro do intervalo
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./esDisciplinas.sh;;
        2)  clear
            echo 'Coloque ID da Disciplina'
            read ID
            clear
            if [ grep $ID $dados -eq -1 ] || [ $ID -gt 39999 ] || [ $ID -lt 30000 ]; # Se ID não existe na base de dados ou o número não está dentro do intervalo reservado
            then
                clear
                echo "Erro!! Disciplina Inexistente!"
            else
                nome=$(grep $ID $dados| cut -d '#' -f 2)                            # Procurar linhas com esse valo na posição 2 do input de disciplinas
                echo "Nº de alunos associados à disciplina $nome"
                valor=$(grep -o ":$nome" $dados |  wc -l)
                echo $valor            
            fi
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./esDisciplinas.sh;;
        3)  clear
            ./mEstatisticas.sh;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'           # Evitar outros inputs não existentes no menu
            read rand
            echo $'\n'
            clear
            ./esDisciplinas.sh;;
    esac

