source /etc/profile && echo "=======加载 /etc/profile环境变量======"
printf "\n"
source ~/.bashrc && echo "=======加载 ~/.bashrc环境变量======"
printf "\n"


if [ -d $FLUME_HOME/conf ]; then

proxy="https://ghproxy.com/"
FLENV=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/flume/flume-env.sh"
TSHDFS=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/flume/hdfs-test.conf"
TS2=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/flume/test-flmue.sh"

wget -q -t 3 -P $FLUME_HOME/conf $FLENV -O $FLUME_HOME/conf/flume-env.sh
wget -q -t 3 -P $FLUME_HOME/conf $TSHDFS -O $FLUME_HOME/conf/hdfs-test.conf
wget -q -t 3 -P $FLUME_HOME/conf $TS2 -O $FLUME_HOME/conf/test-flmue.sh

sed -i "s,/opt/install/java,$JAVA_HOME,g" FLUME_HOME/conf/flume-env.sh
chmod +x FLUME_HOME/conf/flume-env.sh
fi
