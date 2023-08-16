#!/bin/bash


pd="hadoop"
proxy="https://ghproxy.com/"
hostname="master"


echo "===================更新软件包,安装依赖========================="
if command -v yum &>/dev/null;then
        echo $pd |sudo -S yum install -y net-tools wget curl vim expect
        rpm -e `rpm -qa |grep openjdk`
else
        echo $pd |sudo -S apt install net-tools wget curl vim expect
         sudo apt-get remove openjdk*
fi
echo "==================免密设置==========================="
if [ -d ~/.ssh ]; then
     echo "已经设置过ssh免密"

else
  #TODO:使用超时判断有点bug
    ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 0600 ~/.ssh/authorized_keys
    echo "ssh 设置成功!"
fi

echo "===================配置ip映射================================"

ip=`ifconfig ens33|grep "inet " |awk '{ print $2}'`
echo $pd |sudo -S hostnamectl set-hostname "$hostname"
echo $pd | sudo -S sh -c "echo '${ip} $hostname' >> /etc/hosts"


echo "=====================创建目录============================="
echo $pd |sudo -S mkdir -p /opt/install

if [ "$(uname)" != "Darwin" ]; then
  echo $pd |sudo -S chown -R $USER:$USER /opt/install
fi
