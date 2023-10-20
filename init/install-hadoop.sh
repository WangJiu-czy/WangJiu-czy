proxy="https://ghps.cc/"

hostName=localhost
pcount=$#
if ((pcount==0)); then
    hostName=`hostname`
    
fi

HDENV=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/hadoop-env.sh"
CORE=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/core-site.xml"
HDFS=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/hdfs-site.xml"
MP=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/mapred-site.xml"
YARN=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/yarn-site.xml"

source /etc/profile && echo "=======更新软件源======"
printf "\n"
source ~/.bashrc 
printf "\n"

HD_HOME=$HADOOP_HOME

if [ -d $HADOOP_HOME/etc/hadoop ]; then

wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $HDENV -O $HADOOP_HOME/etc/hadoop/hadoop-env.sh --no-check-certificate
wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $CORE -O $HADOOP_HOME/etc/hadoop/core-site.xml --no-check-certificate
wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $HDFS -O $HADOOP_HOME/etc/hadoop/hdfs-site.xml --no-check-certificate
wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $MP  -O $HADOOP_HOME/etc/hadoop/mapred-site.xml --no-check-certificate
wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $YARN -O $HADOOP_HOME/etc/hadoop/yarn-site.xml --no-check-certificate


sed -i "s,/opt/install/java,$JAVA_HOME,g" $HADOOP_HOME/etc/hadoop/hadoop-env.sh
sed -i "s,/opt/install/hadoop,$HADOOP_HOME,g" $HADOOP_HOME/etc/hadoop/hadoop-env.sh
sed -i "s,/opt/install/bigdata,$HADOOP_HOME,g" $HADOOP_HOME/etc/hadoop/core-site.xml
sed -i "s,/opt/install/bigdata,$HADOOP_HOME,g" $HADOOP_HOME/etc/hadoop/hdfs-site.xml
printf "\n"
sed -i "s,master,$hostName,g" $HADOOP_HOME/etc/hadoop/core-site.xml
sed -i "s,master,$hostName,g" $HADOOP_HOME/etc/hadoop/hdfs-site.xml
sed -i "s,master,$hostName,g" $HADOOP_HOME/etc/hadoop/mapred-site.xml
sed -i "s,master,$hostName,g" $HADOOP_HOME/etc/hadoop/yarn-site.xml
value_path=`hadoop classpath`
sed -i "s,my_hadoop_classpath,$value_path,g" $HADOOP_HOME/etc/hadoop/yarn-site.xml
echo "=======更新完成======="
else
echo "=========================HADOOP_HOME 不存在=========================================="
fi
