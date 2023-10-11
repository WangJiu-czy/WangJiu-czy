
source /etc/profile && echo "=======更新软件源======"
printf "\n"
source ~/.bashrc
printf "\n"


hostName=localhost
pcount=$#
if ((pcount==0)); then
    hostName=`hostname`
    
fi


if [ -d $HIVE_HOME/conf ]; then



HIVE_SITE="https://ghproxy.com/https://raw.githubusercontent.com/WangJiu-czy/WangJiu-czy/main/qx/shell/hive-site.xml"
wget -q -t 3  -P $HIVE_HOME/conf $HIVE_SITE -O $HIVE_HOME/conf/hive-site.xml
echo "nohup hive --service metastore 2>&1 &" >> $HIVE_HOME/bin/hive-meta.sh
echo "nohup hive --service hiveserver2 2>&1 &" >> $HIVE_HOME/bin/hive2.sh
chmod +x $HIVE_HOME/bin/*.sh

sed -i "s,master,$hostName,g" $HIVE_HOME/conf/hive-site.xml
 echo "=======加载成功======"
else
 echo "=======HIVE_HOME不存在======"
fi

