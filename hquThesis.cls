%% hquThesis.cls
%% 华侨大学硕士学位论文 LaTeX 模板
%% 根据《华侨大学研究生学位论文的基本要求及撰写格式（2026年第一、二批毕业研究生使用）》制作
%% 2026版更新

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hquThesis}[2026/02/21 Huaqiao University Thesis Template]

%% ---- 基础文档类 ----
\LoadClass[a4paper, zihao=-4, UTF8, openright, twoside]{ctexbook}

%% ---- 宏包加载 ----
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{amsmath, amssymb, amsfonts}
\RequirePackage{dsfont}        % 双线字体（指示函数 \mathds{1}）
\RequirePackage{mathtools}
\RequirePackage{bm}
\RequirePackage{newtxmath}
\RequirePackage{fontspec}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{float}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
\RequirePackage{xcolor}
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\RequirePackage{multirow}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{tabularx}
\RequirePackage[sort&compress]{gbt7714}
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage{setspace}
\RequirePackage{indentfirst}
\RequirePackage{zhnumber}
\RequirePackage{pdfpages}
\RequirePackage{ulem}        % 下划线
\RequirePackage{tikz}        % 封面金色横幅

%% ---- 页面设置 ----
\geometry{
  a4paper,
  top=3.8cm,
  bottom=3.8cm,
  left=3.2cm,
  right=3.2cm,
  headheight=15pt,
  headsep=4.7mm,          % 页眉距边界 2.8cm: top(3.8) - 2.8 - headheight(≈0.53) ≈ 0.47
  footskip=1.0cm,
}

%% ---- 页面底部对齐 ----
\raggedbottom  % 允许页面底部留白，避免段间距被拉伸

%% ---- 字体设置 ----
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}
% 中文字体由 ctex 自动配置

% 封面字体：信息区楷体，题目/作者信息区宋体
\newcommand{\hqu@coverkaifont}{\kaishu}
\IfFileExists{/Users/sd3/Library/Fonts/KaiTi_GB2312.ttf}{%
  \setCJKfamilyfont{hqucoverkai}[Path=/Users/sd3/Library/Fonts/]{KaiTi_GB2312.ttf}
  \renewcommand{\hqu@coverkaifont}{\CJKfamily{hqucoverkai}}
}{%
  \IfFontExistsTF{KaiTi}{%
    \setCJKfamilyfont{hqucoverkai}{KaiTi}
    \renewcommand{\hqu@coverkaifont}{\CJKfamily{hqucoverkai}}
  }{%
    \IfFontExistsTF{Kaiti SC}{%
      \setCJKfamilyfont{hqucoverkai}{Kaiti SC}
      \renewcommand{\hqu@coverkaifont}{\CJKfamily{hqucoverkai}}
    }{%
      \IfFontExistsTF{STKaiti}{%
        \setCJKfamilyfont{hqucoverkai}{STKaiti}
        \renewcommand{\hqu@coverkaifont}{\CJKfamily{hqucoverkai}}
      }{}%
    }%
  }%
}
\newcommand{\hqu@coversongfont}{\songti}
\IfFontExistsTF{SimSun}{%
  \setCJKfamilyfont{hqucoversong}{SimSun}[AutoFakeBold=2]
  \renewcommand{\hqu@coversongfont}{\CJKfamily{hqucoversong}}
}{%
  \IfFontExistsTF{Songti SC}{%
    \setCJKfamilyfont{hqucoversong}{Songti SC}[BoldFont=Songti SC Bold]
    \renewcommand{\hqu@coversongfont}{\CJKfamily{hqucoversong}}
  }{%
    \IfFontExistsTF{STSong}{%
      \setCJKfamilyfont{hqucoversong}{STSong}
      \renewcommand{\hqu@coversongfont}{\CJKfamily{hqucoversong}}
    }{}%
  }%
}

%% ---- 行距设置 ----
%% 小四号(12pt) × 1.3 ≈ 视觉上等效Word"固定行距20磅"
\renewcommand{\baselinestretch}{1.3}

%% ---- 段落缩进 ----
\setlength{\parindent}{2em}

%% ---- 页眉页脚通用样式 ----
\newcommand{\hqu@headertext}{华侨大学硕士学位论文}
\newcommand{\hqu@headerfont}{\fontsize{10.5bp}{14bp}\selectfont}
\newcommand{\hqu@pagefont}{\rmfamily\fontsize{10.5bp}{14bp}\selectfont}

%% ---- 论文信息命令 ----
\newcommand{\hqu@title}{}
\newcommand{\hqu@titleEN}{}
\newcommand{\hqu@author}{}
\newcommand{\hqu@studentid}{}
\newcommand{\hqu@advisor}{}
\newcommand{\hqu@coadvisor}{}
\newcommand{\hqu@discipline}{}
\newcommand{\hqu@direction}{}
\newcommand{\hqu@school}{}
\newcommand{\hqu@submitdate}{}
\newcommand{\hqu@schoolcode}{10385}

\newcommand{\thesistitle}[1]{\renewcommand{\hqu@title}{#1}}
\newcommand{\thesistitleEN}[1]{\renewcommand{\hqu@titleEN}{#1}}
\newcommand{\thesisauthor}[1]{\renewcommand{\hqu@author}{#1}}
\newcommand{\studentid}[1]{\renewcommand{\hqu@studentid}{#1}}
\newcommand{\advisor}[1]{\renewcommand{\hqu@advisor}{#1}}
\newcommand{\coadvisor}[1]{\renewcommand{\hqu@coadvisor}{#1}}
\newcommand{\discipline}[1]{\renewcommand{\hqu@discipline}{#1}}
\newcommand{\direction}[1]{\renewcommand{\hqu@direction}{#1}}
\newcommand{\thesisSchool}[1]{\renewcommand{\hqu@school}{#1}}
\newcommand{\submitdate}[1]{\renewcommand{\hqu@submitdate}{#1}}

%% ---- 下划线填充命令 ----
\newcommand{\hqu@underline}[2][6cm]{\uline{\hbox to #1{\hss #2 \hss}}}

%% ---- 封面 ----
\newcommand{\makecover}{%
  \begin{titlepage}
    \renewcommand{\baselinestretch}{1.0}\selectfont
    \newgeometry{top=3.2cm, bottom=2.6cm, left=2.4cm, right=2.2cm}
    \thispagestyle{empty}
    % ---- 学校代码和学号 ----
    \noindent
    {\hqu@coverkaifont\fontsize{10.5bp}{16bp}\selectfont
      学校代码：\uline{\hqu@schoolcode} \hfill 分类号：\uline{\hbox to 3cm{\hss\hss}}\\[3pt]
      研究生学号：\uline{\hqu@studentid} \hfill 密\hspace{1em}级：\uline{\hbox to 3cm{\hss\hss}}%
    }

    \vspace{0.8cm}

    % ---- 校徽和校名 + 硕士学位论文横幅（占满页面宽度）----
    \noindent\hspace*{-2.4cm}\includegraphics[width=\paperwidth]{figures/image1.png}

    \vspace{1.0cm}

    % ---- 论文题目 ----
    \begin{center}
      {\hqu@coversongfont\bfseries\fontsize{16bp}{28bp}\selectfont \hqu@title}\\[0.8cm]
      {\bfseries\fontsize{16bp}{24bp}\selectfont \hqu@titleEN}
    \end{center}

    \vfill

    % ---- 作者信息（标签黑体14号，内容宋体14号加粗）----
    \begin{center}
      {\fontsize{14bp}{24bp}\selectfont
        \renewcommand{\arraystretch}{1.3}
        \begin{tabular}{r@{：}c}
          {\heiti 作者姓名} & \hqu@underline[7cm]{\hqu@coversongfont\bfseries\hqu@author} \\
          {\heiti 指导教师} & \hqu@underline[7cm]{\hqu@coversongfont\bfseries\hqu@advisor} \\
          \ifdefempty{\hqu@coadvisor}{}{{\heiti 合作教师} & \hqu@underline[7cm]{\hqu@coversongfont\bfseries\hqu@coadvisor} \\}
          {\heiti 学\hspace{2em}科} & \hqu@underline[7cm]{\hqu@coversongfont\bfseries\hqu@discipline} \\
          {\heiti 研究方向} & \hqu@underline[7cm]{\hqu@coversongfont\bfseries\hqu@direction} \\
          {\heiti 所在学院} & \hqu@underline[7cm]{\hqu@coversongfont\bfseries\hqu@school} \\
        \end{tabular}
      }
    \end{center}

    \vspace{1.5cm}

    \begin{center}
      {\fontsize{14bp}{20bp}\selectfont {\heiti 论文提交日期：}{\hqu@coversongfont\bfseries\hqu@submitdate}}
    \end{center}

    \vspace{0.5cm}
    \restoregeometry
    \renewcommand{\baselinestretch}{1.3}\selectfont
  \end{titlepage}
  \setcounter{page}{0}
}

%% ---- 答辩委员会决议页（从PDF直接引入）----
\newcommand{\includecommittee}[1]{%
  \includepdf[pages=1]{#1}
}

%% ---- 声明页（严格按照学校模板）----
\newcommand{\makedeclaration}{%
  \thispagestyle{empty}
  \vspace*{0pt}

  \begin{center}
    {\songti\bfseries\fontsize{16bp}{24bp}\selectfont 学位论文独创性声明}
  \end{center}
  \vspace{24bp}

  {\songti\fontsize{14bp}{28bp}\selectfont
    \setlength{\parindent}{2em}

    本人声明兹呈交的学位论文是本人在导师指导下完成的研究成果。论文写作中不包含其他人已经发表或撰写过的研究内容，如参考他人或集体的科研成果，均在论文中以明确的方式说明。本人依法享有和承担由此论文所产生的权利和责任。\par
  }

  \vspace{60bp}

  {\songti\fontsize{14bp}{28bp}\selectfont
    \hfill 论文作者签名：\hspace{4cm} 签名日期：\hspace{2cm}\par
  }

  \vspace{80bp}

  \begin{center}
    {\songti\bfseries\fontsize{16bp}{24bp}\selectfont 学位论文版权使用授权声明}
  \end{center}
  \vspace{24bp}

  {\songti\fontsize{14bp}{28bp}\selectfont
    \setlength{\parindent}{2em}

    本人同意授权华侨大学有权保留并向国家机关或机构送交学位论文的复印件和电子版，允许学位论文被查阅和借阅。本人授权华侨大学可以将本学位论文的全部内容或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。\par
  }

  \vspace{60bp}

  {\songti\fontsize{14bp}{28bp}\selectfont
    \noindent\hspace{2em}论文作者签名：\hspace{3cm} 指导教师签名：\hspace{2cm}\par
    \vspace{12bp}
    \noindent\hspace{2em}签\hspace{0.5em}名\hspace{0.5em}日\hspace{0.5em}期：\hspace{3cm} 签\hspace{0.5em}名\hspace{0.5em}日\hspace{0.5em}期：\hspace{2cm}\par
  }
  \clearpage
}

%% ---- 页眉页脚设置 ----
\fancypagestyle{frontmatter}{%
  \fancyhf{}
  \fancyhead[CE]{\songti\hqu@headerfont \hqu@headertext}
  \fancyhead[CO]{\hqu@headerfont \nouppercase{\leftmark}}
  \fancyfoot[C]{\hqu@pagefont \thepage}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{mainmatter}{%
  \fancyhf{}
  \fancyhead[CE]{\songti\hqu@headerfont \hqu@headertext}
  \fancyhead[CO]{\hqu@headerfont \nouppercase{\leftmark}}
  \fancyfoot[C]{\hqu@pagefont \thepage}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyhead[CE]{\songti\hqu@headerfont \hqu@headertext}
  \fancyhead[CO]{\hqu@headerfont \nouppercase{\leftmark}}
  \fancyfoot[C]{\hqu@pagefont \thepage}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0pt}
}

%% ---- 章节标题格式 ----
\ctexset{
  chapter = {
    format = \centering\heiti\fontsize{16bp}{25.05bp}\selectfont,
    nameformat = {},
    titleformat = {},
    name = {第,章},
    number = \arabic{chapter},
    aftername = \hspace{1em},
    fixskip = true,
    beforeskip = 24bp,
    afterskip = 18bp,
    pagestyle = plain,
  },
  section = {
    format = \raggedright\heiti\fontsize{14bp}{20bp}\selectfont,
    aftername = \hspace{1em},
    beforeskip = 24bp,
    afterskip = 6bp,
  },
  subsection = {
    format = \raggedright\heiti\fontsize{12bp}{20bp}\selectfont,
    aftername = \hspace{1em},
    beforeskip = 12bp,
    afterskip = 6bp,
  },
  subsubsection = {
    format = \raggedright\heiti\fontsize{12bp}{20bp}\selectfont,
    aftername = \hspace{1em},
    beforeskip = 12bp,
    afterskip = 6bp,
  },
}

%% ---- 目录格式 ----
\renewcommand{\contentsname}{目\hspace{1em}录}

% 设置编号深度：编号至三级节标题（subsubsection），如 1.2.2.1
\setcounter{secnumdepth}{3}
% 设置目录深度：列至二级节标题（subsection）
\setcounter{tocdepth}{2}

% 章标题行：黑体小四号，固定行距20磅，段前6磅，段后0磅，居左
\titlecontents{chapter}[0em]
  {\vspace{6bp}\heiti\fontsize{12bp}{20bp}\selectfont}
  {\thecontentslabel\hspace{1em}}
  {}
  {\hspace{0.5em}\titlerule*[0.4pc]{.}\contentspage}[\vspace{0bp}]

% 一级节标题：宋体小四号，固定行距20磅，段前0磅，段后0磅，左缩进1个汉字符
\titlecontents{section}[1em]
  {\vspace{0bp}\songti\fontsize{12bp}{20bp}\selectfont}
  {\thecontentslabel\hspace{1em}}
  {}
  {\hspace{0.5em}\titlerule*[0.4pc]{.}\contentspage}[\vspace{0bp}]

% 二级节标题：宋体小四号，固定行距20磅，段前0磅，段后0磅，左缩进2个汉字符
\titlecontents{subsection}[2em]
  {\vspace{0bp}\songti\fontsize{12bp}{20bp}\selectfont}
  {\thecontentslabel\hspace{1em}}
  {}
  {\hspace{0.5em}\titlerule*[0.4pc]{.}\contentspage}[\vspace{0bp}]

%% ---- 图表标题格式 ----
\DeclareCaptionFont{hqucaptionfont}{\songti\fontsize{11bp}{13bp}\selectfont}
\captionsetup[figure]{
  font = hqucaptionfont,
  labelsep = quad,          % 图序与图名之间空一个汉字符宽度
  aboveskip = 6bp,
  belowskip = 12bp,
  justification = centering,
  format = hang,
}

\captionsetup[table]{
  font = hqucaptionfont,
  labelsep = quad,          % 表序与表名之间空一个汉字符宽度
  aboveskip = 12bp,
  belowskip = 6bp,
  justification = centering,
  format = hang,
}

%% ---- 三线表线粗（booktabs）----
\setlength{\heavyrulewidth}{1.5bp}   % 表格上下边线粗 1.5 磅
\setlength{\lightrulewidth}{1bp}     % 表格中间线粗 1 磅

%% ---- 公式编号格式 ----
\numberwithin{equation}{chapter}
\renewcommand{\theequation}{\thechapter.\arabic{equation}}
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}

%% ---- 公式编号使用中文全角括号 "（1.2）" ----
\makeatletter
\def\tagform@#1{\maketag@@@{（\ignorespaces#1\unskip\@@italiccorr）}}
\makeatother

%% ---- 公式环境间距 ----
\AtBeginDocument{
  \setlength{\abovedisplayskip}{6bp}
  \setlength{\belowdisplayskip}{6bp}
  \setlength{\abovedisplayshortskip}{6bp}
  \setlength{\belowdisplayshortskip}{6bp}
}

%% ---- 摘要环境 ----
\newenvironment{cnabstract}{%
  \clearpage
  \phantomsection
  \markboth{摘要}{摘要}
  \vspace*{-8bp}
  {\centering\heiti\fontsize{16bp}{25.05bp}\selectfont 摘\hspace{1em}要\par}
  \vspace{18bp}
  \songti\fontsize{12bp}{20bp}\selectfont
  \setlength{\parindent}{2em}
}{%
  \clearpage
}

\newcommand{\cnkeywords}[1]{%
  \par\vspace{12bp}\noindent
  {\heiti 关键词：}#1
}

\newenvironment{enabstract}{%
  \clearpage
  \phantomsection
  \markboth{Abstract}{Abstract}
  \vspace*{-8bp}
  {\centering\sffamily\bfseries\fontsize{16bp}{25.05bp}\selectfont Abstract\par}
  \vspace{18bp}
  \fontsize{12bp}{20bp}\selectfont
  \setlength{\parindent}{1em}  % 英文摘要首行缩进2个英文字符（≈1em）
}{%
  \clearpage
}

\newcommand{\enkeywords}[1]{%
  \par\vspace{12bp}\noindent
  {\bfseries Key Words: }#1
}

%% ---- 参考文献格式 ----
\renewcommand{\bibsection}{%
  \chapter*{参考文献}
  \addcontentsline{toc}{chapter}{参考文献}
  \markboth{参考文献}{参考文献}
}

\renewcommand{\bibfont}{\zihao{5}}
\setlength{\bibsep}{3bp}
\AtBeginEnvironment{thebibliography}{%
  \setlength{\baselineskip}{16bp}
  \setlength{\itemsep}{3bp}
  \setlength{\parsep}{0bp}
  \setlength{\parskip}{0bp}
}

%% ---- 致谢环境 ----
\newenvironment{acknowledgement}{%
  \clearpage
  \phantomsection
  \chapter*{致\hspace{1em}谢}
  \addcontentsline{toc}{chapter}{致谢}
  \markboth{致谢}{致谢}
  \fangsong\fontsize{14bp}{28bp}\selectfont
  \setlength{\parindent}{2em}
}{%
  \clearpage
}

%% ---- 个人简历环境 ----
\newenvironment{resume}{%
  \clearpage
  \phantomsection
  \chapter*{个人简历、在学期间发表的学术论文与研究成果}
  \addcontentsline{toc}{chapter}{个人简历、在学期间发表的学术论文与研究成果}
  \markboth{个人简历、在学期间发表的学术论文与研究成果}{个人简历、在学期间发表的学术论文与研究成果}
  \songti\fontsize{12bp}{20bp}\selectfont
  \setlength{\parindent}{2em}
}{%
  \clearpage
}

%% ---- 主要符号对照表环境 ----
\newenvironment{symbollist}{%
  \clearpage
  \phantomsection
  \chapter*{主要符号对照表}
  \addcontentsline{toc}{chapter}{主要符号对照表}
  \markboth{主要符号对照表}{主要符号对照表}
  \songti\zihao{-4}
  \setlength{\baselineskip}{21bp}    % 符号对照表行距 21 磅
}{%
  \clearpage
}

%% ---- 结论命令 ----
\newcommand{\conclusion}{%
  \chapter*{结\hspace{1em}论}
  \addcontentsline{toc}{chapter}{结论}
  \markboth{结论}{结论}
}

%% ---- 超链接设置 ----
\hypersetup{
  colorlinks = true,
  linkcolor = black,
  citecolor = black,
  urlcolor = blue,
  bookmarksnumbered = true,
  bookmarksopen = true,
  pdfstartview = FitH,
}

%% ---- 脚注格式（2026版新增）----
%% 序号①②③按页编号，宋体小五号，悬挂缩进1.5字符，段前段后0磅
\RequirePackage{pifont}
\renewcommand{\thefootnote}{\ding{\numexpr171+\value{footnote}}}  % ①②③④…
\renewcommand{\footnoterule}{\vspace*{-3pt}\hrule width 0.3\textwidth \vspace*{2.6pt}}
\renewcommand{\footnotesize}{\fontsize{9bp}{12bp}\selectfont}     % 小五号
\makeatletter
\renewcommand\@makefntext[1]{%
  \setlength{\parindent}{1.5em}%                                  % 悬挂缩进1.5字符
  \noindent\makebox[1.5em][l]{\@thefnmark\hspace{0.25em}}#1%     % 序号后空半个汉字符
}
\makeatother

%% ---- 列表设置 ----
\setlist{noitemsep, topsep=0pt, parsep=0pt}

%% ---- 重定义 \cleardoublepage：空白偶数页保留当前页眉页脚和页码 ----
\makeatletter
\renewcommand{\cleardoublepage}{%
  \clearpage
  \if@twoside
    \ifodd\c@page\else
      \hbox{}\newpage
      \if@twocolumn\hbox{}\newpage\fi
    \fi
  \fi
}
\makeatother

\endinput
