proxy_list=(
    "https://ghps.cc/"
    "https://ghproxy.com/"
)

proxy="https://ghps.cc/"
hostName=localhost
pcount=$#
if ((pcount==0)); then
    hostName=`hostname`
fi

## 测试代理连接
function test_url(){
for ((i = 0; i < ${#proxy_list[@]}; i++)); do
urlstatus=$(curl -s -m 5 -IL ${proxy_list[i]}|grep 200)
if [ "$urlstatus" == "200" ];then
    proxy=${proxy_list[i]}
    return 1
fi
done
echo "===========所有代理不可用=========="
}

function download_conf(){

HDENV=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/hadoop-env.sh"
CORE=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/core-site.xml"
HDFS=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/hdfs-site.xml"
MP=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/mapred-site.xml"
YARN=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/yarn-site.xml"

source /etc/profile && echo "=======更新软件源======"
printf "\n"
source ~/.bashrc 
printf "\n"


if [ -d $HADOOP_HOME/etc/hadoop ]; then

wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $HDENV -O $HADOOP_HOME/etc/hadoop/hadoop-env.sh --no-check-certificate
echo "--->E"
wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $CORE -O $HADOOP_HOME/etc/hadoop/core-site.xml --no-check-certificate
echo "--->C"
wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $HDFS -O $HADOOP_HOME/etc/hadoop/hdfs-site.xml --no-check-certificate
echo "--->H"
wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $MP  -O $HADOOP_HOME/etc/hadoop/mapred-site.xml --no-check-certificate
echo "--->M"
wget -q -t 3  -P $HADOOP_HOME/etc/hadoop $YARN -O $HADOOP_HOME/etc/hadoop/yarn-site.xml --no-check-certificate
echo "--->Y"

echo "===========下载完成============="
else
echo "======HADOOP_HOME 不存在========="
fi

}
function set_conf(){
if [ -d $HADOOP_HOME/etc/hadoop ]; then
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
echo "===========更新完成==============="
else
echo "=============HADOOP_HOME 不存在==========="
fi
}


function main(){
test_url()
download_conf()
set_conf()
}
