proxy="https://ghproxy.com/"
HDENV=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/local/hadoop/hadoop-env.sh"
CORE=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/local/hadoop/core-site.xml"
HDFS=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/local/hadoop/hdfs-site.xml"
MP=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/local/hadoop/mapred-site.xml"
YARN=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/local/hadoop/yarn-site.xml"


path="/usr/local/hadoop/etc/hadoop"

if [ -d $path ]; then

wget -P $path $HDENV -O $path/hadoop-env.sh
wget -P $path $CORE -O $path/core-site.xml
wget -P $path $HDFS -O $path/hdfs-site.xml
wget -P $path $MP  -O $path/mapred-site.xml
wget -P $path $YARN -O $path/yarn-site.xml


fi
