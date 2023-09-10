#!/bin/bash


pd=$1
proxy="https://ghproxy.com/"
hostname=$2



##------------------------------------------------------------------------------------

#需要主要镜像源有没有这个版本
SPARK_VERSION=3.3.3
SPARK_URL="https://mirrors.tuna.tsinghua.edu.cn/apache/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop3-scala2.13.tgz"


if [ ! -d /opt/install/java ]; then
     echo "===========================下载jdk=============================="
     wget -P /opt/install  https://repo.huaweicloud.com/java/jdk/8u202-b08/jdk-8u202-linux-x64.tar.gz && tar -zxvf /opt/install/jdk-8u202-linux-x64.tar.gz -C /opt/install
     mv /opt/install/jdk1.8.0_202  /opt/install/java
     echo $pd |sudo -S sh -c "echo 'export JAVA_HOME=/opt/install/java' >> /etc/profile"
     echo $pd |sudo -S sh -c "echo 'export PATH=\$PATH:\$JAVA_HOME/bin' >> /etc/profile"
     printf "\n"
fi


curl -fSL "$SPARK_URL" -o /opt/install/spark.tar.gz \
    && tar -xvf /opt/install/spark.tar.gz -C /opt/install

mv /opt/install/spark-$SPARK_VERSION-bin-hadoop3-scala2.13 /opt/install/spark
SPARK_ENV=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/spark/spark-env.sh"

wget -P /opt/install/spark/conf  $SPARK_ENV -O /opt/install/spark/conf/spark-env.sh
mv /opt/install/spark/conf/spark-defaults.conf.template /opt/install/spark/conf/spark-defaults.conf
mv /opt/install/spark/conf/workers.template /opt/install/spark/conf/workers
chmod +x /opt/install/spark/conf/spark-env.sh

echo $pd |sudo -S sh -c "echo 'export SPARK_HOME=/opt/install/spark' >> /etc/profile"

printf "\n"

##echo "==================写入配置==================================="
if [ ! -d /opt/install/hadoop ]; then
     echo "spark.eventLog.enabled           false" >> /opt/install/spark/conf/spark-defaults.conf

     echo $pd |sudo -S sh -c "echo 'export PATH=\$PATH:\$SPARK_HOME/bin:\$SPARK_HOME/sbin' >> /etc/profile"

else
   mkdir -p /opt/install/bin
    ln -s /opt/install/spark/sbin/start-all.sh /opt/install/spark/bin/start-spark.sh
    ln -s /opt/install/spark/sbin/stop-all.sh /opt/install/spark/bin/stop-spark.sh
    echo "spark.eventLog.enabled           true
    spark.eventLog.dir               hdfs://master:8020/sparklog/
    spark.eventLog.compress          true" >> /opt/install/spark/conf/spark-defaults.conf
    echo $pd |sudo -S sh -c "echo 'export PATH=\$PATH:\$SPARK_HOME/bin' >> /etc/profile"
    #/opt/install/hadoop/bin/hdfs dfs -mkdir -p /sparklog
fi




sed -i 's/localhost/master/g' /opt/install/spark/conf/workers
printf "\n"


rm /opt/install/*gz
echo "========================下载anaconda3=========================="

#curl -fSLK /opt/install/ https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2020.11-Linux-x86_64.sh -o /opt/install/anaconda3-2020.sh
curl -fSLk $proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/install_anaconda.sh" | expect

echo $pd |sudo -S sh -c "echo 'export ANACONDA_HOME=/opt/install/anaconda3' >> /etc/profile"
echo $pd |sudo -S sh -c "echo 'export PATH=\$PATH:\$ANACONDA_HOME/bin' >> /etc/profile"

/opt/install/anaconda3/bin/conda init



exit 0


