 基础实战项目 (Day 17 结课)

这是一个基于 Docker Compose 构建的自动化部署项目，包含一个定制化的 Web 服务器和一个持久化的数据库。

## 📦 包含组件
- **Web 服务**: 基于 Nginx 定制的 Web 服务器 (`my-custom-webserver:v1`)。
- **数据库**: PostgreSQL 官方镜像，支持数据持久化。
- **配置管理**: 使用 `.env` 文件隔离环境敏感信息。

## 🛠️ 如何启动
1. **克隆项目到本地**
2. **配置环境变量**：
   在项目根目录创建 `.env` 文件，内容参考如下：
   ```env
   POSTGRES_DB=app_data
   POSTGRES_USER=your_user
   POSTGRES_PASSWORD=your_password

docker compose up -d
