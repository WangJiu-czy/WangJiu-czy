#!/usr/bin/expect -f

set timeout 60
set conda_path /opt/install/anaconda3
set filename Anaconda3-2020.02-Linux-x86_64.sh



spawn wget -q  --show-progress -P /opt/install /opt/install/ https://mirrors.aliyun.com/anaconda/archive/$filename --no-check-certificate


expect  eof

spawn bash /opt/install/$filename -b -p $conda_path
expect "license terms?"
send "yes\r"
expect  eof
spawn $conda_path/bin/pip install pyspark==3.3.3 -i https://pypi.tuna.tsinghua.edu.cn/simple
expect eof
