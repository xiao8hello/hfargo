# 老王一键argox安装脚本
# 创建argox目录并设置权限
mkdir -p "argox" && chmod -R 777 "argox" > /dev/null 2>&1 && cd "argox" > /dev/null 2>&1
# 获取系统架构
ARCH=$(uname -m)


# 根据架构下载并运行不同的程序
case $ARCH in
    "aarch64" | "arm64"| "arm")
        wget https://arm64.2go.us.kg/argox -O argox
        ;;
    "x86_64" | "amd64"| "x86")
        wget https://amd64.2go.us.kg/argox -O argox
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

if [ -f "argox" ]; then
    chmod +x argox
    if [ -n "$nezha_server" ] && [ -n "$nezha_port" ] && [ -n "$nezha_key" ]; then
        NEZHA_SERVER=$nezha_server NEZHA_PORT=$nezha_port NEZHA_KEY=$nezha_key ./argox
    else
        ./argox
    fi
else
    echo "Failed to download the binary for architecture: $ARCH"
    exit 1
fi
echo -e "${green}\n安装完成，复制以上节点粘贴到v2rayN中导入；${red}删除root目录下的argox文件夹重启服务器即可卸载！${re}"
sleep 1
# tail -f /dev/null

# 在这里配置哪吒面板变量
chmod +x agent.sh && env NZ_SERVER= NZ_TLS=false NZ_CLIENT_SECRET= ./agent.sh

# 伪装博客
mkdir hexo && cd hexo
hexo init
hexo server