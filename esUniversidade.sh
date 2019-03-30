#!/bin/bash
clear
dados="dados.txt"
echo "1) NºUniversidades"
echo "2) Alunos por universidade"
echo "3) Voltar"
read opt
    case $opt in
        1)  clear
            echo 'Número de Universidades Registadas :'
            awk '($1+0)>=10000 && ($1+0)<=19999' dados.txt | wc -l                  # Pesquisar valores dentro do intervalo
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./esUniversidade.sh;;
        2)  clear
            grep @ $dados
            echo 'Coloque ID da Universidade'
            read ID
            clear
            if [ "$(grep -c $ID $dados)" -ne 1 ] || [ $ID -gt 19999 ] || [ $ID -lt 10000 ]; # Se ID não existe na base de dados ou o número não está dentro do intervalo reservado
            then
                echo "Erro!! Universidade Inexistente"
            else
                nome=$(grep $ID $dados| cut -d @ -f 2)                              # Procurar linhas com esse valo na posição 2 do input de universidades
                echo "Nº de alunos associados inscritos na universidade $nome"
                valor=$(grep -o "$nome:" $dados |  wc -l)
                echo $valor            
            fi
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./esUniversidade.sh;;
        3)  ./mEstatisticas.sh;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'           # Evitar outros inputs não existentes no menu
            read rand
            echo $'\n'
            clear
            ./esUniversidade.sh;;
    esac