#!/bin/bash
check_service(){
	SERVICE_NAME=$1
	SERVICE=(devops_vm test_server_1)
	echo -n "正在检查服务：$SERVICE_NAME ... "
	systemctl status "$SERVICE_NAME" > /dev/null 2>&1
	STATUS_CODE=$?
	if [ $STATUS_CODE -eq 0 ]; then
		echo "正在运行(OK)"
	elif [ $STATUS_CODE -eq 3 ]; then
		echo "未运行(FAIL)"
	elif [ $STATUS_CODE -eq 4 ]; then
		echo "未找到(MISSING)"
	else
		echo "状态异常(CODE: $STATUS_CODE)"
	fi
}
SERVICE_TO_CHECK=("sshd" "cron" "nginx" "docker" "mysql")

echo "--- 系统基础资源检查 ---"
df -h
free -h
echo "------------------------------------------------"
echo "--- 关键服务状态检查(使用 for 循环) ---"
for SERVICE in "$SERVICE_TO_CHECK[@]}"
do
	check_service "$SERVICE"
done
for SERVER in "${SERVERS[@]}"; do
	echo "--- 检查服务器 $SERVER ---"
	ssh "$SERVER" "echo '磁盘状态：' && df -h | grep -v Filesystem"
	ssh "$SERVER" "echo '内存状态：’&& free -h"
	echo "-----------------------------------------------"
done

