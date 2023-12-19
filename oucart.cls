\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oucart}[2015/05/20 OUC Undergraduate Thesis Template]

\LoadClass[11pt,a4paper]{article}

\newif\iflangcn
\newif\iflangen

\DeclareOption{cn}{\langcntrue}
\DeclareOption{en}{\langentrue}
\ProcessOptions\relax

\RequirePackage{ctex}
\RequirePackage{CJKutf8}
% Windows用户使用以下字体配置
\setCJKmainfont{SimSun}[AutoFakeBold] %用于实现字体加粗
\setCJKsansfont{SimHei}
\setCJKmonofont{FangSong}

% macOS用户使用以下字体配置 
%\setCJKmainfont[BoldFont=STHeiti,ItalicFont=STKaiti]{STSong}
%\setCJKsansfont[BoldFont=STHeiti]{STXihei}
%\setCJKmonofont{STFangsong}

\RequirePackage{amsmath}
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{subfigure}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{ulem}
\RequirePackage{xcolor}
\RequirePackage{listings}


% 用来设置附录中代码的样式
\lstset{
	basicstyle          =   \sffamily,          % 基本代码风格
	keywordstyle        =   \bfseries,          % 关键字风格
	commentstyle        =   \rmfamily\itshape,  % 注释的风格，斜体
	stringstyle         =   \ttfamily,  % 字符串风格
	flexiblecolumns,                % 别问为什么，加上这个
	numbers             =   left,   % 行号的位置在左边
	showspaces          =   false,  % 是否显示空格，显示了有点乱，所以不显示了
	numberstyle         =   \zihao{-5}\ttfamily,    % 行号的样式，小五号，tt等宽字体
	showstringspaces    =   false,
	captionpos          =   t,      % 这段代码的名字所呈现的位置，t指的是top上面
	frame               =   lrtb,   % 显示边框
}
\lstdefinestyle{Python}{
	language        =   Python, % 语言选Python
	basicstyle      =   \zihao{-5}\ttfamily,
	numberstyle     =   \zihao{-5}\ttfamily,
	keywordstyle    =   \color{blue},
	keywordstyle    =   [2] \color{teal},
	stringstyle     =   \color{magenta},
	commentstyle    =   \color{red}\ttfamily,
	breaklines      =   true,   % 自动换行，建议不要写太长的行
	columns         =   fixed,  % 如果不加这一句，字间距就不固定，很丑，必须加
	basewidth       =   0.5em,
}

% 页边距设置
\RequirePackage{geometry}
\linespread{1.5}

\RequirePackage{fancyhdr}
\pagestyle{fancy}

\RequirePackage{assets/cover}
\RequirePackage{assets/abstractkeywords}
\RequirePackage{assets/signature}
\RequirePackage{assets/gbt7714}

% ``目录'', ``参考文献''样式
\iflangcn
\renewcommand{\contentsname}{\heiti\centerline{\zihao{3}{\heiti{目\ \ \ \ 录\par}}}}
\renewcommand{\refname}{\noindent\heiti\zihao{4}{参考文献：}}
\fi
\iflangen
\renewcommand{\contentsname}{\centerline{\zihao{3}{\heiti{Contents}}}}
\renewcommand{\refname}{\centerline{References}}
\fi

% 调整页边距
\geometry{top=2.54cm,bottom=2.54cm,left=3cm,right=3cm} 

\makeatletter

% 修改引用标记为上角标
\def\@cite#1#2{\textsuperscript{[{#1\if@tempswa , #2\fi}]}}

% 定义基本信息
\newcommand*{\entitle}[1]{
  \def\@entitle{#1}
}
\newcommand*{\advisor}[1]{
  \def\@advisor{#1}
}
\newcommand*{\department}[2]{
  \def\@college{#1}
  \def\@department{#2}
}

\lhead{}
\rhead{}
\chead{\small{\@title}} % 页眉

\makeatother

% 修改标题样式
\titleformat{\section}
            {\zihao{-3}\heiti\raggedright}
            {\arabic{section}}{1em}
            {}
\titleformat{\subsection}
            {\zihao{4}\heiti\raggedright}
            {\arabic{section}.\arabic{subsection}}{1em}
            {}
\titleformat{\subsubsection}
            {\zihao{4}\kaishu\raggedright}
            {\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}{1em}
            {}
% 修改目录样式
\titlecontents{section}
              [10mm]
              {\zihao{-3}\heiti}
              {\contentslabel{1em}}
              {\linespread{2}}
              {\titlerule*{.}\contentspage}
\titlecontents{subsection}
              [20mm]
              {\zihao{4}\heiti}
              {\contentslabel{2em}}
              {\linespread{2}}
              {\titlerule*{.}\contentspage}
\titlecontents{subsubsection}
              [30mm]
              {\zihao{4}\kaishu}
              {\contentslabel{3em}}
              {\linespread{2}}
              {\titlerule*{.}\contentspage}
% 为了把致谢和参考文献放入目录
\titlecontents{nonumbersection}
              [4.6mm]
              {\zihao{-4}\songti}
              {\contentslabel{0em}}
              {}
              {\titlerule*{.}\contentspage}

% 修改部分页眉样式
\fancypagestyle{zhabstract}{
\chead{\small{摘\ \ \ 要}}
}

\fancypagestyle{enabstract}{
\chead{\small{Abstract}}
}

\fancypagestyle{tableofcontents}{
\chead{\small{目\ \ \ 录}}
}

% 图、表、公式样式
\captionsetup{figurewithin=section}
\captionsetup{tablewithin=section}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\renewcommand\thefigure{\arabic{section}-\arabic{figure}}
\renewcommand\thetable{\arabic{section}-\arabic{table}}
\renewcommand{\labelenumi}{(\theenumi)}
\renewcommand{\captionfont}{\zihao{5}\heiti} 
\numberwithin{equation}{section}
