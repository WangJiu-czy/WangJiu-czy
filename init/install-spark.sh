proxy="https://ghps.cc/"
F1=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/spark/spark-defaults.conf"
F2=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/spark/spark-env.sh"
F3=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/spark/workers"
source /etc/profile && echo "=======加载 /etc/profile环境变量======"
printf "\n"
source ~/.bashrc 
printf "\n"
SP_HOME=$SPARK_HOME

hostName=localhost
pcount=$#
if ((pcount==0)); then
    hostName=`hostname`
    
fi


if [ -d $SP_HOME/conf  ]; then

ln -s $SPARK_HOME/sbin/start-all.sh $SPARK_HOME/bin/start-spark.sh
ln -s $SPARK_HOME/sbin/stop-all.sh $SPARK_HOME/bin/stop-spark.sh

wget -q -t 3  -P $SP_HOME/conf  $F1 -O $SP_HOME/conf/spark-defaults.conf --no-check-certificate
wget -q -t 3  -P $SP_HOME/conf  $F2 -O $SP_HOME/conf/spark-env.sh --no-check-certificate
wget -q -t 3  -P $SP_HOME/conf  $F3 -O $SP_HOME/conf/workers --no-check-certificate
chmod +x  $SP_HOME/conf/spark-env.sh

sed -i "s,master,$hostName,g" $SP_HOME/conf/spark-env.sh
sed -i "s,/opt/install/java,$JAVA_HOME,g" $SP_HOME/conf/spark-env.sh
sed -i "s,master,$hostName,g" $SP_HOME/conf/workers
echo "=======加载成功======"
if [ -d $HADOOP_HOME ]; then
  echo "export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop" >> $SP_HOME/conf/spark-env.sh
fi


else

echo "=======SPARK_HOME不存在======"
fi

