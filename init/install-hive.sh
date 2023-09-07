HIVE_SITE="https://ghproxy.com/https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/hive-site.xml"
wget -P /opt/install/hive/conf $HIVE_SITE -O /opt/install/hive/conf/hive-site.xml
mkdir -p /opt/install/bin
echo "nohup hive --service metastore 2>&1 &" >> /opt/install/bin/hive-meta.sh
echo "nohup hive --service hiveserver2 2>&1 &" >> /opt/install/bin/hive2.sh
chmod +x /opt/install/bin/*.sh
