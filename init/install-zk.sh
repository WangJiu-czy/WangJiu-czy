mkdir -p /opt/install/zookeeper/data && echo "1" > /opt/install/zookeeper/data/myid
mv /opt/install/zookeeper/zoo-sample.cfg  /opt/install/zookeeper/zoo.cfg
sed -i 's,/tmp/zookeeper,/opt/install/zookeeper/data,g' /opt/install/zookeeper/conf/zoo.cfg
