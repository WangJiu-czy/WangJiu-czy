proxy="https://ghproxy.com/"
HDENV=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/hadoop-env.sh"
CORE=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/core-site.xml"
HDFS=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/hdfs-site.xml"
MP=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/mapred-site.xml"
YARN=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/yarn-site.xml"
SLAVE=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/workers"

if [ -d /opt/install/hadoop/etc/hadoop ]; then

wget -P /opt/install/hadoop/etc/hadoop $HDENV -O /opt/install/hadoop/etc/hadoop/hadoop-env.sh
wget -P /opt/install/hadoop/etc/hadoop $CORE -O /opt/install/hadoop/etc/hadoop/core-site.xml
wget -P /opt/install/hadoop/etc/hadoop $HDFS -O /opt/install/hadoop/etc/hadoop/hdfs-site.xml
wget -P /opt/install/hadoop/etc/hadoop $MP  -O /opt/install/hadoop/etc/hadoop/mapred-site.xml
wget -P /opt/install/hadoop/etc/hadoop $YARN -O /opt/install/hadoop/etc/hadoop/yarn-site.xml
wget -P /opt/install/hadoop/etc/hadoop $SLAVE -O  /opt/install/hadoop/etc/hadoop/workers

fi
