
mkdir -p /opt/install/zookeeper/data && echo "1" > /opt/install/zookeeper/data/myid
mv /opt/install/zookeeper/conf/zoo_sample.cfg  /opt/install/zookeeper/conf/zoo.cfg
sed -i 's,/tmp/zookeeper,/opt/install/zookeeper/data,g' /opt/install/zookeeper/conf/zoo.cfg
