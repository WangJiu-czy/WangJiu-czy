path=$1
HIVE_SITE="https://ghproxy.com/https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/hive-site.xml"
wget -P $path/conf $HIVE_SITE -O $path/conf/hive-site.xml
echo "nohup hive --service metastore 2>&1 &" >> $path/bin/hive-meta.sh
echo "nohup hive --service hiveserver2 2>&1 &" >> $path/bin/hive2.sh
chmod +x $path/bin/*.sh
