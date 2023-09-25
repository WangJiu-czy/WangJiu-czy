proxy="https://ghproxy.com/"
HBENV=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/hbase/hbase-env.sh"
CORE=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/hbase/hbase-site.xml"
SLAVE=$proxy"https://github.com/WangJiu-czy/WangJiu-czy/blob/main/init/conf/hbase/regionservers"

source /etc/profile && echo "=======加载 /etc/profile环境变量======"
printf "\n"
source ~/.bashrc && echo "=======加载 ~/.bashrc环境变量======"
printf "\n"


hostName=`hostname`
if [ -d $HBASE_HOME  ]; then

wget -P $HBASE_HOME/conf $HBENV -O $HBASE_HOME/conf/hbase-env.sh
wget -P $HBASE_HOME/conf $CORE -O $HBASE_HOME/conf/hbase-site.xml
wget -P $HBASE_HOME/conf $SLAVE -O $HBASE_HOME/conf/regionservers

sed -i "s,master,$hostName,g"  $HBASE_HOME/conf/regionservers
sed -i "s,/opt/install/java,$JAVA_HOME,g" $HBASE_HOME/conf/hbase-env.sh
sed -i "s,master,$hostName,g"  $HBASE_HOME/conf/hbase-site.xml
fi
