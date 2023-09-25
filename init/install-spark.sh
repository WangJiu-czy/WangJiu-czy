proxy="https://ghproxy.com/"
F1=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/spark/spark-defaults.conf"
F2=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/spark/spark-env.sh"
F3=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/spark/workers"
prePATH=$1
SP_HOME=$prePATH"/spark"
hostName=`hostname`


if [ -d $SP_HOME/conf  ]; then
source /etc/profile && echo "=======加载 /etc/profile环境变量======"
printf "\n"
source ~/.bashrc && echo "=======加载 ~/.bashrc环境变量======"
printf "\n"


wget -P $SP_HOME/conf  $F1 -O $SP_HOME/conf/spark-defaults.conf
wget -P $SP_HOME/conf  $F2 -O $SP_HOME/conf/spark-env.sh
wget -P $SP_HOME/conf  $F3 -O $SP_HOME/conf/workers
chmod +x  $SP_HOME/conf/spark-env.sh

sed -i "s,master,$hostName,g" $SP_HOME/conf/spark-env.sh
sed -i "s,/opt/install/java,$JAVA_HOME,g" $SP_HOME/conf/spark-env.sh
sed -i "s,master,$hostName,g" $SP_HOME/conf/workers
if [ -d $HADOOP_HOME ]; then
  echo "export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop" >> $SP_HOME/conf/spark-env.sh
fi

fi
