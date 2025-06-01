# config.nu
#
# Installed by:
# version = "0.104.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

$env.config.buffer_editor = "code"
# $env.config = {
#     shell_integration: {osc133 : false}
# }
$env.config.shell_integration.osc133 = false # Windows解决输出随输入不断上移的bug

# 用于将starship用作nushell美化
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# 关闭启动会话
$env.config.show_banner = false

# 创建ll命令别名
alias ll = ls -l

# 创建一个自定义命令，用来更新我的网页(注意的是，自定义命令的语法格式要求很严格，比如[]和{}的空格、是否换行)
def updateWeb [] {
    cd D:/code/chunyujin_top_web
    npm run deploy
}

# 创建一个自定义命令，用来更新网页git
def gitWeb [] {
    cd D:/code/chunyujin_top_web
    npm run git_push
}