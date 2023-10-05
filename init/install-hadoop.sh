proxy="https://ghproxy.com/"

hostName=`hostname`

HDENV=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/hadoop-env.sh"
CORE=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/core-site.xml"
HDFS=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/hdfs-site.xml"
MP=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/mapred-site.xml"
YARN=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/yarn-site.xml"

source /etc/profile && echo "=======加载 /etc/profile环境变量======"
printf "\n"
source ~/.bashrc && echo "=======加载 ~/.bashrc环境变量======"
printf "\n"

HD_HOME=$HADOOP_HOME

if [ -d $HD_HOME/etc/hadoop ]; then

wget -q -t 3  -P $HD_HOME/etc/hadoop $HDENV -O $HD_HOME/etc/hadoop/hadoop-env.sh
wget -q -t 3  -P $HD_HOME/etc/hadoop $CORE -O $HD_HOME/etc/hadoop/core-site.xml
wget -q -t 3  -P $HD_HOME/etc/hadoop $HDFS -O $HD_HOME/etc/hadoop/hdfs-site.xml
wget -q -t 3  -P $HD_HOME/etc/hadoop $MP  -O $HD_HOME/etc/hadoop/mapred-site.xml
wget -q -t 3  -P $HD_HOME/etc/hadoop $YARN -O $HD_HOME/etc/hadoop/yarn-site.xml


sed -i "s,/opt/install/java,$JAVA_HOME,g" $HD_HOME/etc/hadoop/hadoop-env.sh
sed -i "s,/opt/install/hadoop,$HADOOP_HOME,g" $HD_HOME/etc/hadoop/hadoop-env.sh
sed -i "s,/opt/install/bigdata,$HADOOP_HOME,g" $HD_HOME/etc/hadoop/core-site.xml
sed -i "s,/opt/install/bigdata,$HADOOP_HOME,g" $HD_HOME/etc/hadoop/hdfs-site.xml
printf "\n"
sed -i "s,master,$hostName,g" $HD_HOME/etc/hadoop/core-site.xml
sed -i "s,master,$hostName,g" $HD_HOME/etc/hadoop/hdfs-site.xml
sed -i "s,master,$hostName,g" $HD_HOME/etc/hadoop/mapred-site.xml
sed -i "s,master,$hostName,g" $HD_HOME/etc/hadoop/yarn-site.xml


fi
