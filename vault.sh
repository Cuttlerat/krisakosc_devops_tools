#!/usr/bin/env bash

ansible_vault() {
    ansible-vault "$1" $(cat .encrypt_list | xargs) --vault-password-file .vault
}

case $1 in
    encrypt)
        ansible_vault encrypt
        ;;
    decrypt)
        ansible_vault decrypt
        ;;
    push)
        ansible_vault encrypt
        shift
        [[ "$*" == "" ]] && MESSAGE="Fast commit" || MESSAGE="$*"
        git add .
        git commit -m "${MESSAGE}"
        git push
        ansible_vault decrypt
        ;;
esac
