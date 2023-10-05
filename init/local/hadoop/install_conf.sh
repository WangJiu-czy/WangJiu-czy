proxy="https://ghproxy.com/"

HDENV=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/hadoop-env.sh"
CORE=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/local/hadoop/core-site.xml"
HDFS=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/local/hadoop/hdfs-site.xml"
MP=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/local/hadoop/mapred-site.xml"
YARN=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/local/hadoop/yarn-site.xml"

source /etc/profile && echo "=======加载 /etc/profile环境变量======"
printf "\n"
source ~/.bashrc && echo "=======加载 ~/.bashrc环境变量======"
printf "\n"

if [ -d $HADOOP_HOME ]; then

wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $HDENV -O $HADOOP_HOME/etc/hadoop/hadoop-env.sh
wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $CORE -O $HADOOP_HOME/etc/hadoop/core-site.xml
wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $HDFS -O $HADOOP_HOME/etc/hadoop/hdfs-site.xml
wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $MP  -O $HADOOP_HOME/etc/hadoop/mapred-site.xml
wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $YARN -O $HADOOP_HOME/etc/hadoop/yarn-site.xml


sed -i "s,/opt/install/java,$JAVA_HOME,g" $HADOOP_HOME/etc/hadoop/hadoop-env.sh
sed -i "s,/opt/install/hadoop,$HADOOP_HOME,g" $HADOOP_HOME/etc/hadoop/hadoop-env.sh
sed -i "s,/usr/local/hadoop,$HADOOP_HOME,g" $HADOOP_HOME/etc/hadoop/core-site.xml
sed -i "s,/usr/local/hadoop,$HADOOP_HOME,g" $HADOOP_HOME/etc/hadoop/hdfs-site.xml

value_path=`hadoop classpath`
sed -i "s,my_hadoop_classpath,$value_path,g" $HADOOP_HOME/etc/hadoop/yarn-site.xml


fi
