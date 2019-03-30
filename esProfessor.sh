#!/bin/bash
clear
dados="dados.txt"
echo "1) NºProfessores"
echo "2) Alunos por professor"
echo "3) Média de alunos por professor"
echo "4) Professor com mais alunos"
echo "5) Voltar"
read opt
    case $opt in
        1)  
            clear
            echo 'Número de Professores Registados :'
            awk '($1+0)>=40000 && ($1+0)<=49999' dados.txt | wc -l                  # Pesquisar valores dentro do intervalo
            echo $'\n\nPressione [ENTER] para avançar.\n'                           
            read rand
            echo $'\n'
            clear
            ./esProfessor.sh;;
        2)  
            clear
            grep , $dados
            echo $'\nColoque ID do Professor'
            read ID
            if [ "$(grep -c $ID $dados)" -ne 1 ] || [ $ID -gt 49999 ] || [ $ID -lt 40000 ]; # Se ID não existe na base de dados ou o número não está dentro do intervalo reservado
            then
                clear
                echo "Erro!! Professor não encontrado!"
            else
                clear
                nome=$(grep $ID $dados| cut -d , -f 2)                              # Procurar linhas com esse valo na posição 2 do input de professores
                echo "Nº de alunos associados ao professor(a) $nome"
                valor=$(grep -o "$nome:" $dados |  wc -l)
                echo $valor  
            fi     
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./esProfessor.sh;;
        3)
            clear
            alunos=$(grep -c : $dados)                                              # Contar número de alunos
            profs=$(grep -c , $dados)                                               # Contar número de professores
            echo "Média de alunos por professor"
            echo $((alunos/ profs))                                                 # Obter valor da média
            echo $'\n\nPressione [ENTER] para avançar.\n'                           
            read rand
            echo $'\n'
            clear
            ./esProfessor.sh;;
        
        4)
            clears
            Arraytot=()                                                                 # Array para armazenar numero de alunos por professor
            ArrayID=()                                                                  # Array para armazenar ID dos professores
            ArrayN=()
            ID=40000                                                                    # Valor inicial do ID
            i=0
            while [ $(grep -c $ID $dados) -eq 1 ]                                       # Enquanto existir o ID na base de dados
            do
            
                ArrayN[$i]=$(grep $ID $dados| cut -d , -f 2)                            # Procurar linhas com esse valor na posição 2 do input de professores
                valor=$(grep -o "${ArrayN[$i]}:" $dados |  wc -l)                       # Obter número de alunos
                ArrayID[$i]=$ID                                                         # Inserir valores no array
                Arraytot[$i]=$valor
                #echo "${Arraytot[$i]}"
                i=$(($i+1))                                                             
                ID=$(($ID+1))                                                           # Passar para o ID seguinte
            done

            pos=0                                                                       # Inicializar valores para obter valor máximo e a sua posição
            max=0
            pmax=-1
            while [ $i -gt $pos ] ; do                                                  # Percorrer lista
                if [ $max -lt ${Arraytot[$pos]} ]                                       # Se for maior 
                then                                                
                    max=${Arraytot[$pos]}
                    pmax=$pos
                fi
                pos=$(($pos+1))
            done
            clear 
            echo "O professor com mais alunos é ${ArrayN[$pmax]} com $max alunos"
        
            echo $'\n\nPressione [ENTER] para avançar.\n'                           
            read rand
            echo $'\n'
            clear
            ./esProfessor.sh;;        
        5)  clear
            ./mEstatisticas.sh;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'           # Evitar outros inputs não existentes no menu
            read rand
            echo $'\n'
            clear
            ./esProfessor.sh;;
    esac





