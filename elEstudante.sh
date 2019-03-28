#!/bin/bash
dados="dados.txt"
if grep : $dados ;
then
    echo "Qual deseja eliminar?"
    read numEstEl
    while [ $numEstEl -lt 20000 ] || [ $numEstEl -gt 29999 ] || [ "$(grep -c $numEstEl $dados)" -lt 1 ] ;
    do 
        echo "Este numero não é possivel, tente de novo:"
        read numEstEl
    done
    grep -v $numEstEl $dados > temp.txt
    sort -n temp.txt > $dados 
    rm temp.txt
    echo $'\nPretende apagar novo aluno? [y/n]'
    read ans
    if [ $ans = "y" ] || [ $ans = "yes" ] || [ $ans = "Y" ] || [ $ans = "YES" ] || [ $ans = "yEs" ] || [ $ans = "yES" ] || [ $ans = "yeS" ] || [ $ans = "Yes" ] || [ $ans = "YeS" ] || [ $ans = -1 ] ;
    then
        clear
        ./elEstudante.sh
    else
        ./mEliminar.sh
    fi
else
    echo "Não há professores para apagar. Pressione [ENTER] para avançar."
    read rand
    ./eliminar.sh
fi