#!/bin/bash
clear
echo "1) Editar"
echo "2) Eliminar"
echo "3) Voltar"
read opt
    case $opt in
        1)  ./mEditar.sh
            ./mAltera.sh;;
        2)  ./mEliminar.sh
            ./mAltera.sh;;
        3)
            echo $'\n'
            clear
            ./mPrincipal.sh;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./mAltera.sh;;
    esac
