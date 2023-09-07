#!/bin/bash


pd=$1
proxy="https://ghproxy.com/"
hostname=$2


echo "===================更新软件包,安装依赖========================="
if [[ $(cat /etc/os-release) == *"Ubuntu"* ]]; then
          ##echo $pd |sudo -S apt install net-tools wget curl vim
          echo $pd |sudo -S apt-get remove openjdk*
elif [[ $(cat /etc/os-release) == *"CentOS"* ]]; then
     echo $pd |sudo -S yum install -y net-tools wget curl vim expect
          ##echo $pd |sudo -S rpm -e  --nodeps `rpm -qa |grep openjdk`
          echo $pd |sudo -S systemctl stop firewalld.service
          echo $pd |sudo -S systemctl disable firewalld.service
else
  printf "\n"
  echo "======================无法判断当前系统==================="
  printf "\n"
fi
echo "==================免密设置==========================="
if [ -d ~/.ssh ]; then
     echo "已经设置过ssh免密"

else
    ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 0600 ~/.ssh/authorized_keys
    echo "==========================ssh 设置成功========================================"
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
