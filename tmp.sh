#!/bin/bash
clear
ano=2019
temp=2020
verificacao=$(grep 20003 dados.txt > tmp.txt | sed -i 's/'$temp'/'$ano'/g' tmp.txt)
verificacao=$(grep 20003 dados.txt)
echo "$verificacao"