export JAVA_HOME=/opt/install/java
export SPARK_MASTER_HOST=master
export SPARK_MASTER_PORT=7077
export SPARK_MASTER_WEBUI_PORT=7070
export SPARK_WORKER_CORES=2
export SPARK_WORKER_MEMOBY=1g
export SPARK_WORKER_PORT=7078
export SPARK_WORKER_WEBUI_PORT=7080

export HADOOP_CONF_DIR=/opt/install/hadoop/etc/hadoop
#配置指定的python解释器,这个是使用anaconda创建的虚拟环境
export PYSPARK_PYTHON=/opt/install/anaconda3/bin/python3

export PYSPARK_DRIVER_PYTHON=/opt/install/anaconda3/bin/python3
