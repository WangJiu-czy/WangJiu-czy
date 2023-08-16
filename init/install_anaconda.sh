#!/usr/bin/expect -f

set timeout 60
set conda_path /opt/install/anaconda3

spawn curl -fSLK /opt/install/ https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2020.11-Linux-x86_64.sh -o /opt/install/Anaconda.sh
expect  eof

spawn bash /opt/install/Anaconda.sh -b -p $conda_path
expect "license terms?"
send "yes\r"
expect  eof
spawn $conda_path/bin/pip install pyspark==3.3.2 -i https://pypi.tuna.tsinghua.edu.cn/simple
expect eof
