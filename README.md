# HQU-Thesis-Template

华侨大学硕士学位论文 LaTeX 模板，根据《华侨大学研究生学位论文的基本要求及撰写格式》制作。

## 模板特性

- 封面、摘要、目录、正文、参考文献、致谢、附录、个人简历等完整结构
- 答辩委员会决议页和声明页支持直接引入 PDF
- 章节编号支持至四级标题（1.2.2.1）
- 三线表、多行合并表格
- 公式全角括号编号（1.1）
- 脚注使用 ①②③ 格式，按页编号
- 参考文献采用 GB/T 7714 数字编号格式，支持 sort&compress
- 算法伪代码排版
- 子图（subfigure）排版

## 目录结构

```
HQU-Thesis-Template/
├── hquThesis.cls          # 模板类文件
├── main.tex               # 主文件
├── refs.bib               # 参考文献
├── latexmkrc              # latexmk 配置
├── Makefile               # 编译脚本
├── chapters/
│   ├── abstract_cn.tex    # 中文摘要
│   ├── abstract_en.tex    # 英文摘要
│   ├── chapter1.tex       # 第1章 绪论
│   ├── chapter2.tex       # 第2章 相关理论基础
│   ├── conclusion.tex     # 结论
│   ├── acknowledgement.tex # 致谢
│   ├── resume.tex         # 个人简历
│   └── appendixA.tex      # 附录：排版功能示例
├── figures/
│   ├── image1.png         # 校徽+校名横幅
│   ├── committee.pdf      # 答辩委员会决议（占位）
│   └── declaration.pdf    # 声明页（占位）
├── .gitignore             # Git 忽略文件
└── README.md              # 本文件
```

## 编译环境

- TeX 发行版：TeX Live 2023 或更新版本（推荐）/ MacTeX
- 编译引擎：XeLaTeX
- 参考文献：BibTeX + gbt7714-numerical 样式
- 所需宏包：ctex, geometry, fancyhdr, booktabs, amsmath, natbib, subcaption, algorithm, algorithmic, tikz 等（均包含在 TeX Live 完整安装中）

## 编译方法

### 方法一：使用 latexmk（推荐）

```bash
latexmk main.tex
```

### 方法二：使用 Makefile

```bash
make
```

### 方法三：手动编译

```bash
xelatex main
bibtex main
xelatex main
xelatex main
```

### 清理编译产物

```bash
make clean       # 清理中间文件
make distclean   # 清理所有产物（含 PDF）
```

## 使用说明

1. 修改 `main.tex` 中的论文基本信息（标题、作者、导师等）
2. 在 `chapters/` 目录下编写各章节内容
3. 在 `refs.bib` 中添加参考文献条目
4. 将答辩委员会决议和声明页的 PDF 放入 `figures/` 目录
5. 将校徽横幅图片 `image1.png` 放入 `figures/` 目录
6. 编译生成 PDF

## 字体说明

模板默认使用以下字体：

- 英文：Times New Roman / Arial / Courier New
- 中文：由 ctex 宏包自动配置（Windows 使用中易字体，macOS 使用华文字体）
- 封面楷体：自动检测系统可用楷体（KaiTi / Kaiti SC / STKaiti）
- 封面宋体：自动检测系统可用宋体（SimSun / Songti SC / STSong）

## 注意事项

- 本模板仅供参考，请以学校最新格式要求为准
- 附录 A 包含模板所有排版功能的完整示例，可作为使用参考
- 编译前请确保已安装所需字体和宏包

## 致谢

本模板参考华侨大学研究生院发布的学位论文格式规范制作。
