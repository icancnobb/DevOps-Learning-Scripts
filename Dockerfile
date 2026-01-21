FROM nginx:alpine   

# 复制你的静态文件（推荐用 . 复制全部，避免漏文件）
COPY . /usr/share/nginx/html/

# 强制在 server 块里添加 charset（最高优先级，不会失效）
RUN sed -i '/server {/a \    charset utf-8;' /etc/nginx/conf.d/default.conf

# 可选：更保险，同时强制所有 text/* 类型加 charset
RUN sed -i 's|include /etc/nginx/mime.types;|include /etc/nginx/mime.types;\n    default_type text/html;\n    charset utf-8;|' /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

