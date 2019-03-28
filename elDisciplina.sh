#!/bin/bash
dados="dados.txt"
if grep '#' $dados ;
then
    echo "Qual deseja eliminar?"
    read numDiscEl
    while [ $numDiscEl -lt 30000 ] || [ $numDiscEl -gt 39999 ] || [ "$(grep -c $numDiscEl $dados)" -lt 1 ] ;
    do 
        echo "Este numero não é possivel, tente de novo:"
        read numDiscEl
    done
    grep -v $numDiscEl $dados > temp.txt
    sort -n temp.txt > $dados 
    rm temp.txt
    echo $'\nPretende apagar nova Disciplina? [y/n]'
    read ans
    if [ $ans = "y" ] || [ $ans = "yes" ] || [ $ans = "Y" ] || [ $ans = "YES" ] || [ $ans = "yEs" ] || [ $ans = "yES" ] || [ $ans = "yeS" ] || [ $ans = "Yes" ] || [ $ans = "YeS" ] || [ $ans = -1 ] ;
    then
        clear
        ./elDisciplina.sh
    else
        ./mEliminar.sh
    fi
else
    echo "Não há disciplinas para apagar. Pressione [ENTER] para avançar."
    read rand
    ./mEliminar.sh
fi