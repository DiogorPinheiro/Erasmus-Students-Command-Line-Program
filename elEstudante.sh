#!/bin/bash
clear
dados="dados.txt"
if grep : $dados ;
then
    echo $'\nQual deseja eliminar?'
    read numEstEl
    while [ $numEstEl -lt 20000 ] || [ $numEstEl -gt 29999 ] || [ "$(grep -c $numEstEl $dados)" -lt 1 ] ;   #Verificar se o número existe
    do 
        echo "Este numero não é possivel, tente de novo:"
        read numEstEl
    done
    grep -v $numEstEl $dados > temp.txt  # Todas as linhas que não correspondem ao número indicado passam para um ficheiro temporário
    sort -n temp.txt > $dados           # Introduzir ordenadamente no ficheiro de dados
    rm temp.txt                         
    clear
    echo $'Pretende apagar novo aluno? [y/n]'
    read ans
    if [ $ans = "y" ] || [ $ans = "yes" ] || [ $ans = "Y" ] || [ $ans = "YES" ] || [ $ans = "yEs" ] || [ $ans = "yES" ] || [ $ans = "yeS" ] || [ $ans = "Yes" ] || [ $ans = "YeS" ] || [ $ans = -1 ] ;
    then
        ./elEstudante.sh
    else
        ./mEliminar.sh
    fi
else
    echo "Não há professores para apagar. Pressione [ENTER] para avançar."
    read rand
    ./eliminar.sh
fi