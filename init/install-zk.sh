

source /etc/profile && echo "=======加载 /etc/profile环境变量======"
printf "\n"
source ~/.bashrc && echo "=======加载 ~/.bashrc环境变量======"
printf "\n"

if [ -d $ZOOKEEPER_HOME ]; then

mkdir -p $ZOOKEEPER_HOME/data && echo "1" > $ZOOKEEPER_HOME/data/myid
mv $ZOOKEEPER_HOME/conf/zoo_sample.cfg  $ZOOKEEPER_HOME/conf/zoo.cfg
sed -i "s,/tmp/zookeeper,$ZOOKEEPER_HOME/data,g" $ZOOKEEPER_HOME/conf/zoo.cfg


fi
