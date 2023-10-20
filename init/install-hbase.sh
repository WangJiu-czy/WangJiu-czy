proxy="https://ghproxy.com/"
HBENV=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/hbase/hbase-env.sh"
CORE=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/hbase/hbase-site.xml"
SLAVE=$proxy"https://github.com/WangJiu-czy/WangJiu-czy/blob/main/init/conf/hbase/regionservers"

source /etc/profile  && echo "=============加载软件源==============="
printf "\n"
printf "\n"

hostName=localhost
pcount=$#
if ((pcount==0)); then
    hostName=`hostname`
    
fi

if [ -d $HBASE_HOME  ]; then

wget -q -t 3  -P $HBASE_HOME/conf $HBENV -O $HBASE_HOME/conf/hbase-env.sh --no-check-certificate
wget -q  -t 3   -P $HBASE_HOME/conf $CORE -O $HBASE_HOME/conf/hbase-site.xml --no-check-certificate
wget -q -t 3  -P $HBASE_HOME/conf $SLAVE -O $HBASE_HOME/conf/regionservers --no-check-certificate

sed -i "s,master,$hostName,g"  $HBASE_HOME/conf/regionservers
sed -i "s,/opt/install/java,$JAVA_HOME,g" $HBASE_HOME/conf/hbase-env.sh
sed -i "s,master,$hostName,g"  $HBASE_HOME/conf/hbase-site.xml
echo "=============加载成功==============="
else
echo "===============HBASE_HOME不存在======================"
fi

