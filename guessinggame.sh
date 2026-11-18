#!/usr/bin/env bash

function count_files() {
    ls -1 | wc -l
}

function check_guess() {
    local guess=$1
    local answer=$2

    if [[ $guess -lt $answer ]]; then
        echo "Trop bas ! Essayez encore."
        return 1
    elif [[ $guess -gt $answer ]]; then
        echo "Trop haut ! Essayez encore."
        return 1
    else
        echo "Félicitations ! Vous avez trouvé : il y a $answer fichier(s)."
        return 0
    fi
}

function main() {
    local answer=$(count_files)
    local guess=0
    local tries=0

    echo "Bienvenue dans le jeu de devinette !"
    echo "Combien de fichiers se trouvent dans le répertoire actuel ?"

    while true; do
        echo ""
        read -p "Votre estimation : " guess
        tries=$((tries + 1))

        if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
            echo "Veuillez entrer un nombre entier positif."
            continue
        fi

        if check_guess "$guess" "$answer"; then
            echo "Trouvé en $tries tentative(s) !"
            break
        fi
    done
}

main
