#!/usr/bin/env bash

encrypt() {
    ansible-vault encrypt $(cat .encrypt_list | xargs) --vault-password-file .vault
}

decrypt() {
    ansible-vault decrypt $(cat .encrypt_list | xargs) --vault-password-file .vault
}

case $1 in
    encrypt)
        encrypt
        ;;
    decrypt)
        decrypt
        ;;
    push)
        encrypt
        shift
        [[ "$*" == "" ]] && MESSAGE="Fast commit" || MESSAGE="$*"
        git add .
        git commit -m "${MESSAGE}"
        git push
        decrypt
        ;;
esac
