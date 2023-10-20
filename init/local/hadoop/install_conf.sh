proxy="https://ghproxy.com/"

hostName=localhost
pcount=$#
if ((pcount==0)); then
    hostName=`hostname`
    
fi
HDENV=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/hadoop-env.sh"
CORE=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/local/hadoop/core-site.xml"
HDFS=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/local/hadoop/hdfs-site.xml"
MP=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/local/hadoop/mapred-site.xml"
YARN=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/local/hadoop/yarn-site.xml"

source /etc/profile && echo "=======加载 /etc/profile环境变量======"
printf "\n"
source ~/.bashrc 
printf "\n"

if [ -d $HADOOP_HOME ]; then

wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $HDENV -O $HADOOP_HOME/etc/hadoop/hadoop-env.sh  --no-check-certificate
wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $CORE -O $HADOOP_HOME/etc/hadoop/core-site.xml  --no-check-certificate
wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $HDFS -O $HADOOP_HOME/etc/hadoop/hdfs-site.xml  --no-check-certificate
wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $MP  -O $HADOOP_HOME/etc/hadoop/mapred-site.xml  --no-check-certificate
wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $YARN -O $HADOOP_HOME/etc/hadoop/yarn-site.xml  --no-check-certificate


sed -i "s,/opt/install/java,$JAVA_HOME,g" $HADOOP_HOME/etc/hadoop/hadoop-env.sh
sed -i "s,/opt/install/hadoop,$HADOOP_HOME,g" $HADOOP_HOME/etc/hadoop/hadoop-env.sh
sed -i "s,/usr/local/hadoop,$HADOOP_HOME,g" $HADOOP_HOME/etc/hadoop/core-site.xml
sed -i "s,/usr/local/hadoop,$HADOOP_HOME,g" $HADOOP_HOME/etc/hadoop/hdfs-site.xml

sed -i "s,localhost,$hostName,g" $HADOOP_HOME/etc/hadoop/core-site.xml
sed -i "s,localhost,$hostName,g" $HADOOP_HOME/etc/hadoop/hdfs-site.xml
sed -i "s,localhost,$hostName,g" $HADOOP_HOME/etc/hadoop/mapred-site.xml
sed -i "s,localhost,$hostName,g" $HADOOP_HOME/etc/hadoop/yarn-site.xml

value_path=`hadoop classpath`
sed -i "s,my_hadoop_classpath,$value_path,g" $HADOOP_HOME/etc/hadoop/yarn-site.xml
 echo "=======加载完成======"

fi
