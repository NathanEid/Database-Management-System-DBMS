#!/bin/bash
export LC_COLLATE=C
shopt -s extglob

function isValidName() {
    echo "$1" | grep -q '^[_[:alpha:]][_[:alpha:][:digit:]]*$' && echo "True" || echo "False"
}

isValidName $1
