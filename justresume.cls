% Author: Pannenets F
% github: github.com/PannenetsF 
% Email: pannenets.f@foxmail.com https://github.com/PannenetsF/Justresume

\ProvidesClass{justresume}[2021/03/20 v0.01]
\NeedsTeXFormat{LaTeX2e} 


\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{calc}

\SetupKeyvalOptions{family=JUSTR, prefix=JUSTR@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{JUSTR}{#1}}

% the default language setting is Rnglish 
\DeclareStringOption[en]{lang}
\DeclareVoidOption{cn}{\ekv{lang=cn}}
\DeclareVoidOption{en}{\ekv{lang=en}}

% the defualt cite format is numbers 
\DeclareStringOption[numbers]{cite}
\DeclareVoidOption{numbers}{\ekv{cite=numbers}}
\DeclareVoidOption{super}{\ekv{cite=super}}
\DeclareVoidOption{authoryear}{\ekv{cite=authoryear}}

% the defualt Chinese font format 
\DeclareStringOption[ctexfont]{chinesefont}
\DeclareVoidOption{ctexfont}{\ekv{chinesefont=ctexfont}}
\DeclareVoidOption{founder}{\ekv{chinesefont=founder}}
\DeclareVoidOption{nofont}{\ekv{chinesefont=nofont}}

% the defualt Chinese Title font format 
\DeclareStringOption[simpletitle]{chinesetitle}


% load the resume class 
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*\relax
\LoadClass{article} 

% the preparation is done % 

% include the referrence 
\RequirePackage{hyperref}
\hypersetup{
  pdfborder={0 0 0},
  colorlinks=true,
  linkcolor={winered},
  urlcolor={winered},
  filecolor={winered},
  citecolor={winered},
  linktoc=all,
}

% define the layout 
\RequirePackage[
    left=0.6in,
    right=0.6in,
    top=0.2in,
    bottom=0.5in,
    headheight=0pt,
    headsep=1pt]{geometry}
\setlength{\headsep}{5pt}
% some package 
\RequirePackage{amsthm}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{indentfirst}
\RequirePackage{booktabs}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{fancyvrb}
\RequirePackage{abstract}
\RequirePackage{hologo}
\RequirePackage[fixed]{fontawesome5}

% figure path 
\linespread{1.35}
\graphicspath{{image/}{figure/}{fig/}{img/}}

% table and figure 
\RequirePackage[font=small,labelfont={bf}]{caption}
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

% define somr color 
\RequirePackage{xcolor}
\definecolor{winered}{rgb}{0.5,0,0}
\definecolor{lightgrey}{rgb}{0.95,0.95,0.95}
\definecolor{commentcolor}{RGB}{0,100,0}
\definecolor{frenchplum}{RGB}{190,20,83}

% define the section format 
\RequirePackage{sectsty}
\sectionfont{\sectionrule{1ex}{0pt}{-1ex}{0.3pt}}

% define the item/enum sep
\RequirePackage{enumitem}
\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}


% all ch font 
\PassOptionsToPackage{no-math}{fontspec}
\ifdefstring{\JUSTR@lang}{cn}{
    \ifXeTeX
        \ifdefstring{\JUSTR@chinesefont}{founder}{
        \RequirePackage[UTF8,scheme=plain,fontset=none]{ctex}
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
        \newcommand*{\fangsong}{\CJKfamily{zhfs}}}{\relax}
        
        \ifdefstring{\JUSTR@chinesefont}{nofont}{
        \RequirePackage[UTF8,scheme=plain,fontset=none]{ctex}}{\relax}

        \ifdefstring{\JUSTR@chinesefont}{ctexfont}{
        \RequirePackage[UTF8,scheme=plain]{ctex}}{\relax}
        \ifdefstring{\JUSTR@chinesetitle}{simpletitle}{
            \newcommand{\chtitle}{\songti}}
            {\setCJKfamilyfont{chtitlefont}{\JUSTR@chinesefont}
            \newcommand{\chtitle}{\CJKfamily{chtitlefont}}}
        \setlength\parindent{0\ccwd}
    \else
        \ifdefstring{\JUSTR@chinesefont}{ctexfont}{
        \RequirePackage[UTF8,scheme=plain]{ctex}}{\relax}
    \fi
  }{\relax}

\ifcsname kaishu\endcsname
  \newcommand{\citshape}{\kaishu}
\else
  \newcommand{\citshape}{\itshape}
\fi

\ifcsname kaishu\endcsname
  \newcommand{\cnormal}{\kaishu}
\else
  \newcommand{\cnormal}{\normalfont}
\fi

\ifcsname chtitle\endcsname
  \newcommand{\tfont}{\chtitle}
\else
  \newcommand{\tfont}{\normalfont}
\fi


\ifcsname chtitle\endcsname
  \newcommand{\subifont}{\chtitle}
\else
  \newcommand{\subifont}{\slshape}
\fi

\ifcsname fangsong\endcsname
  \newcommand{\cfs}{\fangsong}
\else
  \newcommand{\cfs}{\normalfont}
\fi


\ifcsname kaishu\endcsname
  \newcommand{\notefont}{\kaishu}
\else
  \newcommand{\notefont}{\itshape}
\fi

\AtBeginDocument{
  \setlength{\abovedisplayskip}{3pt}
  \setlength{\belowdisplayskip}{3pt}
  \RequirePackage[flushmargin]{footmisc}
  \setlength{\footnotesep}{12pt}}


\def\IfEmpty#1{%
    \edef\1{\the#1}
    \ifx\1\empty
    \else{\relax}
}


\newtoks\phonenum
\newtoks\github
\newtoks\linkedin
\newtoks\gitlab
\newtoks\email



\renewcommand\maketitle{\par
\begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@0.1em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    
    \thispagestyle{plain}\@thanks
\endgroup
\setcounter{footnote}{0}%
\global\let\thanks\relax
\global\let\maketitle\relax
\global\let\@maketitle\relax
\global\let\@thanks\@empty
\global\let\@author\@empty
\global\let\@JUSTR@version\@empty
\global\let\@date\@empty
\global\let\@title\@empty
\global\let\title\relax
\global\let\author\relax
\global\let\phonenum\relax
\global\let\date\relax
\global\let\and\relax
\global\let\JUSTR@version\relax
}

\def\@maketitle{%
\newpage
\null
\begin{center}%
  {\Huge\tfont\bfseries \@author \par} 
  \vskip 1em%
  \IfEmpty\phonenum
  \faMobile*\the\phonenum\fi
  \IfEmpty\github
  {\faGithub\href{\the\github}{\color{black}\the\github}} \fi 
  \IfEmpty\linkedin 
  {\faLinkedinIn\href{\the\linkedin}{\color{black}\the\linkedin} }\fi
  \IfEmpty\email 
  {\faEnvelope[regular]\href{mailto:\the\linkedin}{\color{black}\the\email} }\fi
\end{center}%
\par
}


% some functions 
\newcommand{\resumesec}[1]{\section*{\Large #1}}
\newcommand{\timeitem}[2]{{\par {\large\subifont\bfseries #1} \hfill {\large\subifont\bfseries #2} \par}}
\newcommand{\subtimeitem}[2]{{\par {\subifont #1} \hfill {\subifont #2} \par}}
\newcommand{\noteitem}[1]{{\small\notefont{#1}}}
