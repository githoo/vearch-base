#!/bin/bash
# 构建vearch镜像步骤：

DATE=$(date +%Y%m%d)
echo "$DATE"

## 2.编译faiss：

docker build -t faiss:$DATE -f Dockerfile.faiss.docker .

## 3.下载vearch代码及依赖


#下载vearch代码
git clone https://github.com/vearch/vearch.git
#下载依赖代码
cd vearch && git submodule update --init --recursive && cd -


## 4.修改Dockerfile.vearch.docker：


#修改为上述标签
FROM faiss:$DATE


## 5.编译vearch：

docker build -t vearch:$DATE -f Dockerfile.vearch.docker .


## 6.修改标签


#docker tag vearch:v20210406-v1 thub.xxx.com.cn/rs/vearch:$DATE


## 7.推送镜像


#docker push thub.xxx.com.cn/rs/vearch:$DATE
