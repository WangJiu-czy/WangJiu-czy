if [ -d /opt/install/flume/conf ]; then

proxy="https://ghproxy.com/"
FLENV=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/flume/flume-env.sh"
TSHDFS=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/flume/hdfs-test.conf"
TS2=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/flume/test-flmue.sh"

wget -P /opt/install/flume/conf $FLENV -O /opt/install/flume/conf/flume-env.sh
wget -P /opt/install/flume/conf $TSHDFS -O /opt/install/flume/conf/hdfs-test.conf
wget -P /opt/install/flume/conf $TS2 -O /opt/install/flume/conf/test-flmue.sh



fi
