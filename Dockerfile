FROM ubuntu:20.04

# 更新系统并安装 Nginx
RUN apt update && apt install -y nginx

# 复制自定义网页文件到 Nginx 的默认根目录
# 假设您在宿主机（WSL）的当前目录创建了 index.html
COPY index.html /var/www/html/

# 声明容器将对外暴露 80 端口（可选，但推荐）
EXPOSE 80

# 容器启动时运行 Nginx 服务，并保持前台运行
CMD ["nginx", "-g", "daemon off;"]

