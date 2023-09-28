#!/bin/bash

pd=$1
proxy="https://ghproxy.com/"
hostname=$2


wget -qO - 'https://ghproxy.com/https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/init_env.sh' | bash -s "$pd" "$hostname"


cd /opt/install

echo $pd |sudo -S sh -c "echo 'export OPT=/opt/install' >> /etc/profile"
if [ ! -d /opt/install/java ]; then
     echo "===========================下载jdk=============================="
     wget -q --show-progress -P /opt/install  https://repo.huaweicloud.com/java/jdk/8u202-b08/jdk-8u202-linux-x64.tar.gz --no-check-certificate && tar -zxvf /opt/install/jdk-8u202-linux-x64.tar.gz -C /opt/install
     mv /opt/install/jdk1.8.0_202  /opt/install/java
     echo $pd |sudo -S sh -c "echo 'export JAVA_HOME=\$OPT/java' >> /etc/profile"
     echo $pd |sudo -S sh -c "echo 'export PATH=\$PATH:\$JAVA_HOME/bin' >> /etc/profile"
     printf "\n"
fi



export HADOOP_VERSION=$3
export  HADOOP_URL=https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

curl -fSLk "$HADOOP_URL" -o /opt/install/hadoop.tar.gz \
    && tar -xvf /opt/install/hadoop.tar.gz -C /opt/install

mv /opt/install/hadoop-$HADOOP_VERSION /opt/install/hadoop






if [ -d /opt/install/hadoop/etc/hadoop ]; then
wget -qO - 'https://ghproxy.com/https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/install-hadoop.sh' | bash -s "/opt/install"
fi
printf "\n"


echo "=================设置环境变量======================================"

printf "\n"
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




