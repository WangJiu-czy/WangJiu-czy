#!/usr/bin/expect -f

set timeout 60
set conda_path /opt/install/anaconda3
set URL https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2019.07-Linux-x86_64.sh


spawn wget --no-check-certificate -P /opt/install $URL -O /opt/install/Anaconda.sh
expect  eof

spawn bash /opt/install/Anaconda.sh -b -p $conda_path
expect "license terms?"
send "yes\r"
expect  eof
spawn $conda_path/bin/pip install pyspark==3.3.3 -i https://pypi.tuna.tsinghua.edu.cn/simple
expect eof
