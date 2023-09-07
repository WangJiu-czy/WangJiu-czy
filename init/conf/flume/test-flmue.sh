
echo "hello hadoop" >> /opt/install/test-flume.log
echo "hello spark" >> /opt/install/test-flume.log
echo "hello flume" >> /opt/install/test-flume.log
nohup flume-ng agent -c /opt/install/flume/conf -f /opt/install/flume/conf/hdfs-test.conf -n a1  2>&1 &
