#!/bin/bash
clear
dados="dados.txt"
if grep , $dados ;
then
    echo $'\nQual deseja eliminar?'
    read numProfEl
    while [ $numProfEl -lt 40000 ] || [ $numProfEl -gt 49999 ] || [ "$(grep -c $numProfEl $dados)" -lt 1 ] ;
    do 
        echo "Este numero não é possivel, tente de novo:"
        read numProfEl
    done
    nome=$(grep $numProfEl $dados | cut -d , -f 2)
    sed -i 's/'":$nome"'/'":Indefinido"'/g' $dados
    grep -v $numProfEl $dados > temp.txt
    sort -n temp.txt > $dados 
    rm temp.txt
    clear
    echo $'Pretende apagar novo professor? [y/n]'
    read ans
    if [ $ans = "y" ] || [ $ans = "yes" ] || [ $ans = "Y" ] || [ $ans = "YES" ] || [ $ans = "yEs" ] || [ $ans = "yES" ] || [ $ans = "yeS" ] || [ $ans = "Yes" ] || [ $ans = "YeS" ] || [ $ans = -1 ] ;
    then
        ./elProfessor.sh
    else
        ./mEliminar.sh
    fi
else
    echo "Não há professores para apagar. Pressione [ENTER] para avançar."
    read rand
    ./mEliminar.sh
fi