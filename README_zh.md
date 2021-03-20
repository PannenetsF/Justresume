# Justresume
一个尽量简单优雅的简历模板。类文件的设置参考了[ElegantPaper](https://github.com/ElegantLaTeX/ElegantPaper).

## 用法

在使用本模板之前，假定您已经安装好了方正的方正书宋、方正黑体、方正楷体、方正仿宋四款免费商用字体（ GBK 字符集）。如果没有，请在 `documentclass` 中设置 `chinesefont=nofont` ，然后在导言区设定：

```tex
\setCJKmainfont[BoldFont={FZHei-B01},ItalicFont={FZKai-Z03}]{FZShuSong-Z01}
\setCJKsansfont[BoldFont={FZHei-B01},ItalicFont={FZHei-B01}]{FZHei-B01}
\setCJKmonofont[BoldFont={FZHei-B01},ItalicFont={FZHei-B01}]{FZFangSong-Z02}
\setCJKfamilyfont{zhsong}{FZShuSong-Z01}
\setCJKfamilyfont{zhhei}{FZHei-B01}
\setCJKfamilyfont{zhkai}{FZKai-Z03}
\setCJKfamilyfont{zhfs}{FZFangSong-Z02}
\newcommand*{\songti}{\CJKfamily{zhsong}}
\newcommand*{\heiti}{\CJKfamily{zhhei}}
\newcommand*{\kaishu}{\CJKfamily{zhkai}}
\newcommand*{\fangsong}{\CJKfamily{zhfs}}
```

如果你想定制自己的简历 Title 字体，请设置 `chinesetitle=simpletitle` ，然后在导言区设定：

```tex

\setCJKfamilyfont{test}[Path=/usr/path/to/font/]{Handing}
\renewcommand{\chtitle}{\CJKfamily{test}}
```

最后，请使用 xelatex 进行编译。

样例输出请见[英文版](output/justresume-en.pdf), [中文版](output/justresume-cn.pdf).