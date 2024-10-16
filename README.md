# 适用于 Windows 的 gVim 个性化配置

## 项目描述

这个项目保存的是我的个性化 Vim 配置，**适用于 gVim 9.1 或以上版本，Windows 操作系统**。配置入口在 `./init.vim`。从技术上说，理论上这个配置可以被移植到 Unix/Linux 或 Neovim，但是由于从来没有进行过相应的尝试，因此不建议这样做。

配置效果示例如图所示。

![Vim 配置示例效果图](./image/demo.png)

相较于其他用户的 Vim 配置，我的配置的主要特点有：

1. 准备了 $\LaTeX 编辑工具（没办法，我确实是 $\LaTeX$ 用户，如无需要请自行删改。）
2. 专为 Windows 设计、配置文件本身及所有插件安置在 Vim 的安装目录下，不会让你的 C 盘容量变红爆炸；
3. 针对 Windows 上插件管理器时不时安装失效的问题，提前准备了部分插件的本地文件，以便手动安装；
4. 针对 Windows 上 Airline 字体乱码的问题提供了专用的字体 `Consolas for Powerline`；
5. 针对 Windows 上部分插件出现手动安装也装不上的情况提供了备选方案。
6. 为中文的显示读写提供了额外的支持。

将代码开源出来一方面是方便我自己使用、迁移和保存设置，另一方面也能给其他人提供 Vim 配置的代码方案参照。

## 配置功能

### 提供的功能与键位

#### 基础方案

本配置的风格采用如下的基础设置：

| 选配项       | 选配方案        |
| ------------ | --------------- |
| 默认主题     | one             |
| 默认字体     | Consoals + 黑体 |
| 默认引导键   | `\`             |
| 插件管理器   | Vim-Plug        |
| 文件管理器   | NERDTree        |
| 状态栏       | airline.vim     |
| 代码补全方案 | Coc.nvim        |

#### 键位设置

配置提供了如下的键位：

| 按键                    | 功能                                 |
| ----------------------- | ------------------------------------ |
| `\l`                    | 切换主题亮暗模式                     |
| `\v`                    | 打开 markdown 侧边目录功能           |
| `\V`                    | 延长窗口并打开 markdown 侧边目录功能 |
| `Ctrl` + `N`            | 打开文件目录树                       |
| `\n`                    | 打开文件目录树                       |
| `\N`                    | 延长窗口打开文件目录树               |
| `\e`                    | 在文件管理器中打开当前目录           |
| `TAB` + `h`/`j`/`k`/`l` | 切换窗口                             |
| `F5`                    | （部分支持语言）编译运行             |
| `F6`                    | （部分支持语言）调试                 |
| `\wp`                   | 打开 Windows Powershell              |
| `\pw`                   | 打开 Powershell 7                    |
| `\cl`                   | 打开 Windows 自带的 CMD              |
| `\bs`                   | 打开 Windows 安装的 Bash Shell       |
| `\zs`                   | 打开 Windows 安装的 Zsh Shell        |
| `\sa`                   | 逐级调整窗口透明度                   |
**Note**: 由各插件定义的默认功能热键不在此列。

**Note**: 终端开启功能可自行定义。

### 个性化配置

#### 其他热键设置

本配置中所有的热键定义在 `./init/keymap.vim` 中，除了上述表格中列举的设置之外另有部分未被启用的可选方案，可以自行查看，或在现有配置的基础上进行扩展。

#### 自定义终端

本配置中的终端配置在文件 `./init/terminal.vim` 中。可以通过修改如下字典，个性化配置终端启动命令：

```vimscript
" 定义一个字典，存储不同终端的命令
let g:terminals = {
\ 'powershell': 'powershell',
\ 'pwsh': 'pwsh',
\ 'cmd': 'cmd',
\ 'bash': 'bash --login -i',
\ 'zsh': 'zsh --login -i'
\ }
```

使用 `OpenTerminal(key)` 函数启动相应的终端。

## 安装方式

### 安装步骤

标准的安装流程包含 4 个步骤：

1. **导入配置**：包括配置文件本身、Vim-Plug 插件管理器以及无法用插件管理器安装的配色主题 one；
2. **安装字体文件**：Consoals for Powerline
3. **安装插件**：执行 `PlugInstall` 命令自动安装插件
4. **安装自动代码补全方案**：根据个人的实际需求执行 `CocInstall` 命令安装，此不赘述。

### 导入配置

首先将以下文件夹复制到 Vim 安装目录（通常名为 `vim90`、`vim91`、`vim82`，etc）：

1. `autoload` 文件夹，其中包含用于安装插件的插件管理器 Vim-Plug 所需的 `plug.vim` 文件。
2. `colors` 文件夹，其中包括 one 主题的配色文件（one 主题通过插件管理器安装会出现无法正常工作的情况）。
3. `doc` 文件夹，包括用到的插件的文档文件。
4. `vimtweak64.dll`

其次，将以下文件夹复制到 Vim 的运行目录（与上述文件一样的目录）：

1. `./init.vim` 文件，是本配置的入口文件。
2. `./init` 文件夹，是本配置的附属文件的文件夹。
3. `./plugged` 文件夹，是 Vim-Plug 插件的安装目录。

在用户目录或 Vim 安装目录下创建 `.vimrc` 文件，文件中添加如下内容：

```vimscript
source $VIMRUNTIME/init.vim
```

### 安装字体

安装 `./font` 文件夹下全部的 4 个字体文件。

### 安装插件

直接在 Vim 中执行 `PlugInstall` 即可自动安装。

### 安装自动补全方案

在 Coc.Nvim 中执行 `CocInstall` 命令安装代码补全方案。这部分内容根据个人需求操作，此不赘述。

## 文件说明

本项目全部的 `.vim` 配置文件及其功能如下列所示：

```
.
├─ (子目录) init - 保存了 init.vim 下属的配置
│ ├─ color.vim - 颜色和外观样式
│ ├─ keymap.vim - 全部的快捷键及部分快捷键的功能实现
│ ├─ mytabline.vim - MyTabLine 的功能实现
│ ├─ plugrc.vim - 各个插件的安装及配置的导入
│ ├─ plugs - (子目录) 保存了各个插件独立的配置
│ │ ├─ airlinerc.vim - Airline 插件的
│ │ ├─ cocrc.vim - Coc.nvim 自动补全插件
│ │ ├─ mkdprc.vim - Markdown 预览插件
│ │ ├─ netrwrc.vim - 自带的 Netrw 插件（几乎不用）
│ │ ├─ slimerc.vim - Slime 插件
│ │ ├─ vimtexrc.vim - VimTeX 插件
│ │ └─ vistarc.vim - Markdown 导航目录插件
│ ├─ runcode.vim - 运行和调试代码功能的实现
│ ├─ statubar.vim - 状态栏功能的实现
│ ├─ terminal.vim - 一键开启终端功能的实现
│ └─ tocs.vim - md 和 TeX 目录展开和折叠功能的实现
└─ init.vim
```

如有必要在现有配置的基础上对配置进行进一步的个性化修改，希望这些信息能够帮助你正确定位文件和目录。

## 存在的问题与解决

### 字体兼容

通常情况下，针对 Airline 插件使用 Powerline 字体的情况，我们一般直接去 [Powerline 字体的项目仓库](https://github.com/powerline/fonts/tree/master) 下载相应的字体。但是在 Windows 上，这样做会导致 Airline 的倒角处出现豆腐块或者不显示的情况。详情参照 StackExchange 上的提问 [Powerline fonts not working on Airline](https://vi.stackexchange.com/questions/10234/powerline-fonts-not-working-on-airline)，描述了相同的问题。

解决方案来自博客文章 [VIM配置:vim-airline插件安装](https://blog.csdn.net/the_victory/article/details/50638810) 这个博客文章已经是 8 年前的东西了，博主声称自己踩了很大的坑，但是并未详细解释为什么在 Windows 上不能使用 [原生的 Powerline 字体](https://github.com/powerline/fonts)，而是需要找额外的字体。我在网上找了很久也没能找到相应的解释，但是博客文章给出的方案确是可行的。

目前发现在 Windows 上的可用的字体及相应的仓库地址为：

1. [Consolas Powerline](https://github.com/eugeneching/consolas-powerline-vim)
2. [Ubunu Mono Powerline](https://github.com/scotu/ubuntu-mono-powerline)
3. [MesloLGS for Powerline](https://github.com/shumer1213/MesloLGS-for-Powerline)

### 中国用户在安装插件时连接不到 Github

针对中国地区的 Windows 用户连接不到 Github、插件下载安装遇到困难的情况，首先请自备需要上网工具。在此基础之上，请在 `C:\Windows\System32\drivers\etc\hosts` 文件下增加下面一行内容：

```
199.232.68.133 raw.githubusercontent.com
```

再执行 `PlugInstall` 即可。有的时候即使是这样也不能安装，则可以考虑反复执行 `PlugInstall` 重复 10 到 20 遍，耐心等待，直至所有插件正确安装。

## 关于

### 第三方许可证

项目仓库中保存的 Consolas Powerline 字体遵循的有关许可证文件位于 `./fonts` 目录下的 `LICENCE` 文件，请自行查看。

### 开源

本项目根据 MIT 许可证开源，具体请查看 `LICENCE` 文件。除此之外，如果你喜欢我的项目，别忘了帮我点亮小星星；如果对于配置的使用存在任何疑虑，欢迎 [提交 Issue](https://github.com/GitHubonline1396529/vim/issues/new)。项目开源地址：

- Github: [GitHubonline1396529/vim](https://github.com/GitHubonline1396529/vim)
- Gitee: [BOXonline_1396529/vimrc](https://gitee.com/BOXonline_1396529/vimrc)

点击链接前往访问。

