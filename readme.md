# 构建vearch镜像步骤：

## 1.下载dockerfile

```
git clone https://github.com/githoo/vearch-base.git
```

## 2.编译faiss：

```
docker build -t faiss:20210406-v1 -f Dockerfile.faiss.docker .
```

## 3.下载vearch代码及依赖

```
#下载vearch代码
git clone https://github.com/vearch/vearch.git
#下载依赖代码
cd vearch && git submodule update --init --recursive && cd -
```

## 4.修改Dockerfile.vearch.docker：

```
#修改为上述标签
FROM faiss:20210406-v1
```

## 5.编译vearch：

```
docker build -t vearch:v20210406-v1 -f Dockerfile.vearch.docker .
```

## 6.修改标签

```
docker tag vearch:v20210406-v1 thub.xxx.com.cn/rs/vearch:v20210406_v1
```

## 7.推送镜像

```
docker push thub.xxx.com.cn/rs/vearch:v20210406_v1
```