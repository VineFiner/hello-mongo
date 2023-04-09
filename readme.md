# Vapor 应用开发说明

Vapor 是基于 Swift 编程语言而开发的最流行的 Web 网络框架，这是一种更先进、强大且类型安全的编程语言。通过 Vapor，你可以使用 Swift 编写后端、Web 应用 API 或 HTTP 服务，与传统的服务器语言相比具有许多优点。

## 阿里云函数布局

- 通过 NPM 安装最新版本的 Serverless Devs 开发者工具：

```shell
npm install -g @serverless-devs/s
```

- 通过config命令进行密钥等信息的配置：`-f` 强制覆盖密钥信息

```shell
s config add \
--AccessKeyID ${ACCESSKEYID} \
--AccessKeySecret ${ACCESSKEYSECRET} \
--access fc-access \
-f
```

- 初始化项目

```shell script
s init start-vapor -d start-vapor
```

- 开始部署

```shell script
cd start-vapor && s deploy -y -t ./s.yaml -a fc-access --use-local
```

- 参数解析

```md
-t 指定 s.yaml 文件
-a 指定秘钥
--use-local 优先使用本地配置进行部署
-y 在交互时，默认选择y
```

### 按镜像部署函数(写自己的镜像地址)

```
export imageurl="registry-xxx.cn-hongkong.aliyuncs.com/xxx/fc-vapor:$(date +%F-%H-%M-%S)"

s deploy -t ./s.container.yaml -a fc-access --use-local -y

```

### 按二进制部署

```
s deploy -t ./s.yaml -a fc-access --use-local -y
```

## 参考

> <https://docs.serverless-devs.com/fc/command/deploy>
>
> <https://docs.serverless-devs.com/serverless-devs/cicd>
