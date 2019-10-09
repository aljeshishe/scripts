#!/bin/bash
DEFAULT_POSTFIX=github
read -p "Enter postfix for /home/comp/.ssh/id_rsa_<postfix> file($DEFAULT_POSTFIX): " POSTFIX
POSTFIX=${POSTFIX:-$DEFAULT_POSTFIX}

DEFAULT_EMAIL=ax66@bk.ru
read -p "Enter email($DEFAULT_EMAIL): " EMAIL
EMAIL=${EMAIL:-$DEFAULT_EMAIL}

DEFAULT_PASSPHRASE=
read -sp "Enter passphrase(default empty): " PASSPHRASE
PASSPHRASE=${PASSPHRASE:-$DEFAULT_PASSPHRASE}

KEY_FILE=/home/comp/.ssh/id_rsa_$DEFAULT_POSTFIX
PUB_KEY_FILE=$KEY_FILE.pub

ssh-keygen -t rsa -b 4096 -C "$EMAIL" -N $PASSPHRASE -f $KEY_FILE
eval "$(ssh-agent -s)"
ssh-add $KEY_FILE
sudo apt-get install xclip > /dev/null
xclip -sel clip < $PUB_KEY_FILE
echo Key is copied to clipboard
echo Now open https://github.com/settings/keys