
source /etc/profile && echo "=======更新软件源======"
printf "\n"
source ~/.bashrc
printf "\n"

if [ -d $HIVE_HOME/conf ]; then

hostName=localhost
pcount=$#
if ((pcount==0)); then
    hostName=`hostname`
    
fi

HIVE_SITE="https://ghproxy.com/https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/hive-site.xml"
wget -q -t 3  -P $HIVE_HOME/conf $HIVE_SITE -O $HIVE_HOME/conf/hive-site.xml
echo "nohup hive --service metastore 2>&1 &" >> $HIVE_HOME/bin/hive-meta.sh
echo "nohup hive --service hiveserver2 2>&1 &" >> $HIVE_HOME/bin/hive2.sh
chmod +x $HIVE_HOME/bin/*.sh

sed -i "s,master,$hostName,g" $HIVE_HOME/conf/hive-site.xml
fi
 echo "=======加载成功======"
