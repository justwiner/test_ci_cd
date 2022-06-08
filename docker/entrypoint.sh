#!/bin/sh

configFilePath=/data/config.json

echo "加载配置···"

if test -f "$configFilePath"; then
  config=$(cat $configFilePath)

  content="window.process = ${config}"

  printf "$config\n"

  echo "写入配置···"

  echo "$content" >/usr/share/nginx/html/config.js
else
  echo "未检查到配置文件"
fi

echo "启动服务"
nginx -g "daemon off;"
