#!/bin/bash

pd=$1
proxy="https://ghproxy.com/"
hostname=$2


echo "===================更新软件包,安装依赖========================="
# 检测当前系统是Ubuntu还是CentOS
if [[ $(cat /etc/os-release) == *"Ubuntu"* ]]; then
          ##echo $pd |sudo -S apt-get remove openjdk*
elif [[ $(cat /etc/os-release) == *"CentOS"* ]]; then
          echo $pd |sudo -S rpm -e  --nodeps `rpm -qa |grep openjdk`
          echo $pd |sudo -S systemctl stop firewalld.service
          echo $pd |sudo -S systemctl disable firewalld.service
else
  printf "\n"
  echo "======================无法判断当前系统==================="
  printf "\n"
fi


echo "==================免密设置==========================="
if [ -d ~/.ssh ]; then
      printf "\n"

else
    ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 0600 ~/.ssh/authorized_keys

fi

echo "===================配置ip映射================================"
printf "\n"
ip=`ifconfig ens33|grep "inet " |awk '{ print $2}'`
echo $pd |sudo -S hostnamectl set-hostname "$hostname"
echo $pd | sudo -S sh -c "echo '${ip} $hostname' >> /etc/hosts"


echo $pd |sudo -S mkdir -p /opt/install
echo $pd |sudo -S chown -R $USER:$USER /opt/install

# shellcheck disable=SC2164
cd /opt/install

#------------------------------mac从这开始--------------------------------------------

if [ ! -d /opt/install/java ]; then
     echo "===========================下载jdk=============================="
     wget -P /opt/install  https://repo.huaweicloud.com/java/jdk/8u202-b08/jdk-8u202-linux-x64.tar.gz && tar -zxvf /opt/install/jdk-8u202-linux-x64.tar.gz -C /opt/install
     mv /opt/install/jdk1.8.0_202  /opt/install/java
     echo $pd |sudo -S sh -c "echo 'export JAVA_HOME=/opt/install/java' >> /etc/profile"
     echo $pd |sudo -S sh -c "echo 'export PATH=\$PATH:\$JAVA_HOME/bin' >> /etc/profile"
     printf "\n"
fi



export HADOOP_VERSION=$3
export  HADOOP_URL=https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

curl -fSL "$HADOOP_URL" -o /opt/install/hadoop.tar.gz \
    && tar -xvf /opt/install/hadoop.tar.gz -C /opt/install

mv /opt/install/hadoop-$HADOOP_VERSION /opt/install/hadoop






if [ -d /opt/install/hadoop/etc/hadoop ]; then
wget -qO - 'https://ghproxy.com/https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/install-hadoop.sh' | bash -s "/opt/install"
fi
printf "\n"


echo "=================设置环境变量======================================"

echo $pd |sudo -S sh -c "echo 'export OPT=/opt/install' >> /etc/profile"
echo $pd |sudo -S sh -c "echo 'export HADOOP_HOME=\$OPT/hadoop' >> /etc/profile"
echo $pd |sudo -S sh -c "echo 'export PATH=\$PATH:\$HADOOP_HOME/bin:\$HADOOP_HOME/sbin' >> /etc/profile"
echo $pd |sudo -S sh -c "echo 'export HADOOP_CONF_DIR=\$HADOOP_HOME/etc/hadoop' >> /etc/profile"

printf "\n"

echo "======================格式化namenode==========================="
if [ -d /opt/install/bigdata ]; then
     echo $pd |sudo -S rm -rf /opt/install/bigdata
fi


/opt/install/hadoop/bin/hdfs namenode -format



rm /opt/install/*gz
exit 0




