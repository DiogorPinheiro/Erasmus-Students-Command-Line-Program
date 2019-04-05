#!/bin/bash
clear
dados="dados.txt"
if grep @ $dados ;
then
    echo $'\nQual deseja eliminar?'
    read numUniEl
    while [ $numUniEl -lt 10000 ] || [ $numUniEl -gt 19999 ] || [ "$(grep -c $numUniEl $dados)" -lt 1 ] ;
    do 
        echo "Este numero não é possivel, tente de novo:"
        read numUniEl
    done
    nome=$(grep $numUniEl $dados | cut -d @ -f 2)
    sed -i 's/'":$nome"'/'":Indefinido"'/g' $dados
    grep -v $numUniEl $dados > temp.txt
    sort -n temp.txt > $dados 
    rm temp.txt
    clear
    echo $'Pretende apagar nova Universidade? [y/n]'
    read ans
    if [ $ans = "y" ] || [ $ans = "yes" ] || [ $ans = "Y" ] || [ $ans = "YES" ] || [ $ans = "yEs" ] || [ $ans = "yES" ] || [ $ans = "yeS" ] || [ $ans = "Yes" ] || [ $ans = "YeS" ] || [ $ans = -1 ] ;
    then
        ./elUniversidade.sh
    else
        ./mEliminar.sh
    fi
else
    echo "Não há universidades para apagar. Pressione [ENTER] para avançar."
    read rand
    ./mEliminar.sh
fi