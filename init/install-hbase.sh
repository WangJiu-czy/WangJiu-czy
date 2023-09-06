proxy="https://ghproxy.com/"
HBENV=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/hbase/hbase-env.sh"
CORE=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/hbase/hbase-site.xml"

SLAVE=$proxy"https://github.com/WangJiu-czy/WangJiu-czy/blob/main/init/conf/hbase/regionservers"

if [ -d /opt/install/hbase/conf  ]; then

wget -P /opt/install/hbase/conf $HBENV -O /opt/install/hbase/conf/hbase-env.sh
wget -P /opt/install/hbase/conf $CORE -O /opt/install/hbase/conf/hbase-site.xml
wget -P /opt/install/hbase/conf $SLAVE -O /opt/install/hbase/conf/regionservers


fi
