#!/bin/bash
echo "🚀 启动 Day 21 开发模式 (实时热更新)..."

# 1. 清理之前的开发容器
docker rm -f dev-server 2>/dev/null

# 2. 使用 -v 挂载当前目录到 Nginx 目录
# 注意这里使用了你的 8080 端口映射
docker run -d \
  -p 8080:80 \
  --name dev-server \
  -v $(pwd):/usr/share/nginx/html \
  nginx

echo "----------------------------------------"
echo "✅ 开发环境已就绪！"
echo "🌍 访问地址: http://localhost:8080"
echo "💡 提示: 现在修改 index.html 后直接刷新浏览器即可。

# 检查index.html 是否存在
if [ ! -f "index.html" ]; then
    echo "❌ 错误：当前目录下找不到 index.html！"
    exit 1
fi

# 检查是否有 images 目录
if [ ! -d "images" ]; then
    echo "⚠️ 提示：没找到 images 文件夹，你的网页可能没有图片显示。"
fi
