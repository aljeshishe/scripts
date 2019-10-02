#!/bin/bash
set -ex
. install/ubuntu/davfs2.sh
sudo mkdir /mnt/yandex.disk
sudo mount -t davfs https://webdav.yandex.ru /mnt/yandex.disk/