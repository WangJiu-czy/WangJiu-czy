proxy="https://ghproxy.com/"
F1=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/spark/spark-defaults.conf"
F2=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/spark/spark-env.sh"

F3=$proxy"https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/init/conf/spark/workers"

if [ -d /opt/install/spark/conf  ]; then

wget -P /opt/install/spark/conf  $F1 -O /opt/install/spark/conf/spark-defaults.conf
wget -P /opt/install/spark/conf  $F2 -O /opt/install/spark/conf/spark-env.sh
wget -P /opt/install/spark/conf  $F3 -O /opt/install/spark/conf/workers


fi
