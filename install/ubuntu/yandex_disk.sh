#!/bin/bash
set -ex

apt install wget gnupg2 -y

echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/yandex-disk.list > /dev/null
wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | sudo apt-key add - 
sudo apt-get update 
sudo apt-get install -y yandex-disk