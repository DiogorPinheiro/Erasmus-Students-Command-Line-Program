#!/bin/bash
clear
dados="dados.txt"
if grep , $dados ;
then
    echo "Qual deseja eliminar?"
    read numProfEl
    while [ $numProfEl -lt 40000 ] || [ $numProfEl -gt 49999 ] || [ "$(grep -c $numProfEl $dados)" -lt 1 ] ;
    do 
        echo "Este numero não é possivel, tente de novo:"
        read numProfEl
    done
    grep -v $numProfEl $dados > temp.txt
    sort -n temp.txt > $dados 
    rm temp.txt
    echo $'\nPretende apagar novo professor? [y/n]'
    read ans
    if [ $ans = "y" ] || [ $ans = "yes" ] || [ $ans = "Y" ] || [ $ans = "YES" ] || [ $ans = "yEs" ] || [ $ans = "yES" ] || [ $ans = "yeS" ] || [ $ans = "Yes" ] || [ $ans = "YeS" ] || [ $ans = -1 ] ;
    then
        clear
        ./elProfessor.sh
    else
        ./mEliminar.sh
    fi
else
    echo "Não há professores para apagar. Pressione [ENTER] para avançar."
    read rand
    ./mEliminar.sh
fi