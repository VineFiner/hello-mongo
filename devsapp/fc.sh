#!/bin/bash

# 构建镜像，指定 Dockerfile 文件路径 `./hello/Dockerfile`, 指定构建上下文目录 `./hello`
docker build -t fc-vapor-app -f ./hello/Dockerfile ./hello

# 复制构建产物
# docker create --name extract fc-vapor-app
# docker cp extract:/app pkg
# chmod -R 775 pkg
# docker rm -f extract

# 复制构建产物
docker run --rm  \
-w /workspace \
-v $(pwd):/workspace \
--user=root \
--entrypoint /bin/bash \
fc-vapor-app \
-c "\
    rm -rf pkg \
    && cp -r /app pkg \
    && chmod -R 777 pkg"

# 添加启动文件
touch ./pkg/scf_bootstrap && chmod +x ./pkg/scf_bootstrap
cat > ./pkg/scf_bootstrap<<EOF
#!/usr/bin/env bash
# export LD_LIBRARY_PATH=/opt/swift/usr/lib:${LD_LIBRARY_PATH}
./Run serve --env production --hostname 0.0.0.0 --port 9000
EOF

# 打包 资源目录 `./app`, 资源子目录 `./`
#tar cvzf vapor_app-ubuntu.tar.gz -C ./pkg .

# cd pkg && tar cvzf vapor_app-ubuntu.zip *

#END

