%%
%% 長崎大学 論文用スタイルファイル
%% 
%%       by shibata@cis.nagasaki-u.ac.jp Feb. 03, 2015
%%
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{nagasaki}[2017/02/03 長崎大学卒論・修論]
\LoadClass[a4j,11pt]{jreport}

%%
%% 修論オプション
%%
\newcommand{\@master}{0}
\DeclareOption{master}{\renewcommand{\@master}{1}}
\DeclareOption*{\PassOptionsToPackage\CurrentOption{nagasaki}}
\ProcessOptions

%%
%% 欧文・和文間のスペース
%%
\setlength{\xkanjiskip}{0.25em plus 0.15em minus 0.06em}

%%
%% 表題
%%
\renewcommand{\abstractname}{論文内容の要旨}
\renewcommand{\bibname}{参考文献}
\renewcommand{\listfigurename}{図目次}
\renewcommand{\listtablename}{表目次}
\renewcommand{\appendixname}{付録}

%%
%% 目次や表目次などの先頭ページ
%%
\renewcommand{\tableofcontents}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  \chapter*{\contentsname
    \@mkboth{\contentsname}{\contentsname}%
  }\thispagestyle{empty}\@starttoc{toc}%
  \if@restonecol\twocolumn\fi
}
\renewcommand{\listoffigures}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  \chapter*{\listfigurename
  \@mkboth{\listfigurename}{\listfigurename}}%
  \thispagestyle{empty}%
  \@starttoc{lof}%
  \if@restonecol\twocolumn\fi
}
\renewcommand{\listoftables}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  \chapter*{\listtablename
  \@mkboth{\listtablename}{\listtablename}}%
  \thispagestyle{empty}%
  \@starttoc{lot}%
  \if@restonecol\twocolumn\fi
}
\renewcommand*{\l@chapter}[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \addvspace{1.0em \@plus\p@}%
    \begingroup
      \parindent\z@ \rightskip\@pnumwidth \parfillskip-\rightskip
      \leavevmode\headerfont
      \setlength\@lnumwidth{4zw}%
      \advance\leftskip\@lnumwidth \hskip-\leftskip
      #1\nobreak\hfil\nobreak\hbox to\@pnumwidth{\hss#2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

%%
%% float図表の制御関係
%%
\renewcommand{\topfraction}{.8}
\renewcommand{\textfraction}{.1}
\renewcommand{\floatpagefraction}{.6}

%%
%% 禁則処理関係
%%
\prebreakpenalty\jis"2147=10000      % 5000   ’
\postbreakpenalty\jis"2148=10000     % 5000   “
\prebreakpenalty\jis"2149=10000      % 5000   ”
\inhibitxspcode`〒=2

%% 
%% 見出しのフォント
%%
\def\headerfont{\bfseries}

%%
%% 章
%%
\renewcommand{\chapter}{%
  \if@openright\cleardoublepage\else\clearpage\fi
\thispagestyle{plain}%
  \global\@topnum\z@
  \secdef\@chapter\@schapter}

\def\@makechapterhead#1{\hbox{}%
 \vskip2\Cvs {\parindent 0pt \raggedright
 \ifnum \c@secnumdepth >\m@ne \huge\headerfont \@chapapp\thechapter\@chappos
 \par \vskip1\Cvs  \fi \huge \headerfont #1\par \nobreak \vskip3\Cvs}}

\def\@makeschapterhead#1{\hbox{}%
 \vskip2\Cvs { \parindent 0pt \raggedright
 \huge \headerfont #1\par
 \nobreak \vskip3\Cvs} }

%%
%% ページ上部の柱関係
%%
\def\ps@headings{\let\ps@jpl@in\ps@headnombre
    \def\@oddfoot{\hfil\thepage\hfil}
    \def\@evenfoot{\hfil\thepage\hfil}
    \def\@evenhead{%
       \underline{%
       \hbox to \textwidth{{\leftmark}\hfil\rightmark}}}%
    \def\@oddhead{%
       \underline{%
       \hbox to \textwidth{{\leftmark}\hfil\rightmark}}}%
    \let\@mkboth\markboth
  \def\chaptermark##1{\markboth{%
     \ifnum \c@secnumdepth >\m@ne%
    \thechapter%
         \hskip1zw
     \fi
     ##1}{}}%
  \def\sectionmark##1{\markright{%
     \ifnum \c@secnumdepth >\z@ \thesection.\hskip1zw\fi
     ##1}}%
}

%%
%% text用分数
%%
\newcommand{\FRAC}[2]{\leavevmode\kern.1em%
  \raise.5ex\hbox{\the\scriptfont0 #1}\kern-.1em%
  /\kern-.15em\lower.25ex\hbox{\the\scriptfont0 #2}}

%%
%% 表紙
%%
\def\teacher#1{\gdef\@teacher{#1}}
\def\id#1{\gdef\@id{#1}}
\def\lab#1{\gdef\@lab{#1}}
\def\title#1{\gdef\@title{#1}}
\def\maketitle{\begin{titlepage}
 \let\footnotesize\small \let\footnoterule\relax \setcounter{page}{0}
 \ifnum\@ptsize=2
 \let\Huge\huge \let\huge\LARGE \let\LARGE\Large \normalsize\small
 \fi
 \null
 %
 \vbox{%
   \vss
   \vbox to2.8cm{%
     \centering
     \ifnum\@master=1
     \underline{\LARGE 修　士　論　文} 
     \else
     \underline{\LARGE 卒　業　論　文} 
     \fi
     \vss
  }
  \vbox to1cm{\underline{題　　目}\vss}
  \vbox to4.0cm{%
    \centering \parbox{14cm}{\centering \huge \headerfont \@title}
    \vss
  }
  \vbox to1zh{\underline{指導教員}\vss}
  \vbox to5.0cm{\centering \LARGE \@teacher\vss}
  \vbox to4.5cm{\centering \LARGE \@date\vss}
  \vbox to1.5cm{%
    \centering
    \ifnum\@master=1
	{\Large 長崎大学大学院工学研究科　総合工学専攻情報工学コース}
    \else
	{\LARGE 長崎大学工学部工学科　情報工学コース}
    \fi
    \vss
  }
  \vbox to1.0cm{\centering \Huge \@author \LARGE （\@id）\vss}
  \vss
}
\end{titlepage}
\setcounter{footnote}{0} \let\thanks\relax
\let\maketitle\relax}

%%
%% 論文要旨
%%
\newlength\frameWidth
\newlength\frameHeight
\newlength\courseWidthA
\newlength\courseWidthB
\newlength\authorWidthA
\newlength\authorWidthB
\newlength\titleWidthA
\newlength\titleWidthB
\newlength\authorHeight
\newlength\titleHeight

\ifnum\@master=1
  \addtolength{\authorHeight}{15mm}
  \setlength{\courseWidthA}{29.5mm}
  \setlength{\courseWidthB}{48mm}
  \setlength{\titleWidthA}{46.5mm}
  \addtolength{\titleHeight}{21mm}
\else
  \addtolength{\authorHeight}{10.5mm}
  \setlength{\courseWidthA}{28mm}
  \setlength{\courseWidthB}{50mm}
  \setlength{\titleWidthA}{\courseWidthA}
  \addtolength{\titleHeight}{\authorHeight}
\fi
\setlength{\frameWidth}{150mm}
\setlength{\frameHeight}{210mm}
\setlength{\authorWidthA}{15mm}
\setlength{\authorWidthB}{\frameWidth}
\addtolength{\authorWidthB}{-\courseWidthA}
\addtolength{\authorWidthB}{-\courseWidthB}
\addtolength{\authorWidthB}{-\authorWidthA}
\setlength{\titleWidthB}{\frameWidth}
\addtolength{\titleWidthB}{-\titleWidthA}
%
\def\closedBox#1#2#3{%
  \hbox to#2{\hss\vbox to#1{\vss\hbox{#3}\vss}\hss\vrule}%
}
\def\openBox#1#2#3{%
  \hbox to#2{\hss\vbox to#1{\vss\hbox{#3}\vss}\hss}%
}
%
\renewenvironment{abstract}{%
  \titlepage%
  \setcounter{page}{0}%
\ifnum\@master=1
  \vspace*{-10mm}
  \vbox{%
    \openBox{12mm}{\frameWidth}{\parbox{\frameWidth}{%
      \flushleft ~(1--1)}}%
    \openBox{8mm}{\frameWidth}{\abstractname}%
    \openBox{8mm}{\frameWidth}{\parbox{\frameWidth}{%
        \flushright\underline{No.~~~~~~1~~~~~~~}}}%
    \hbox{\vrule%
      \vbox to\frameHeight{%
	\hrule%
	\hbox{%
	  \closedBox{\authorHeight}{\courseWidthA}{%
            \parbox{\courseWidthA}{\centering%
              専 攻 名\\\vspace*{-2mm}{\footnotesize （ コ ー ス 名 ）}}}%
	  \closedBox{\authorHeight}{\courseWidthB}{%
            \parbox{\courseWidthB}{\centering%
              総合工学専攻\\\vspace*{-2mm}{\footnotesize （情報工学コース）}}}%
	  \closedBox{\authorHeight}{\authorWidthA}{氏　名}%
	  \openBox{\authorHeight}{\authorWidthB}{\@author}%
	}%
	\hrule%
        \hbox{%
          \closedBox{\titleHeight}{\titleWidthA}{題 名}%
          \openBox{\titleHeight}{\titleWidthB}{%
            \parbox{\titleWidthB}{%
              \centering%
              \@title
            }%
          }%
        }%
	\hrule%
        \openBox{8mm}{\frameWidth}{\parbox{\frameWidth}{　\abstractname}}
	\vss%
	\hrule%
      }%
      \vrule%
    }%
    \vss%
  }%
  \vspace*{-170mm}%
  \list{}{%
    \setlength{\leftmargin}{8mm}%
    \setlength{\rightmargin}{\leftmargin}%
  }%
  \item\relax%
\else
  \vbox{%
    \openBox{2mm}{\frameWidth}{\large \textbf{\abstractname}}%
    \openBox{12mm}{\frameWidth}{\parbox{\frameWidth}{%
        \flushright{\small 情報工学コース~~}}}%
    \hbox{\vrule%
      \vbox to\frameHeight{%
	\hrule%
	\hbox{%
	  \closedBox{\authorHeight}{\courseWidthA}{履 修 番 号}
	  \closedBox{\authorHeight}{\courseWidthB}{\@id}
	  \closedBox{\authorHeight}{\authorWidthA}{氏　名}%
	  \openBox{\authorHeight}{\authorWidthB}{\@author}%
	}%
	\hrule%
	\hbox{%
	  \closedBox{\titleHeight}{\titleWidthA}{研 究 室 名}
	  \openBox{\titleHeight}{\titleWidthB}{\@lab}%
	}%
        \hrule%
        \hbox{%
          \closedBox{\titleHeight}{\titleWidthA}{研 究 題 名}%
          \openBox{\titleHeight}{\titleWidthB}{%
            \parbox{\titleWidthB}{%
              \centering%
              \@title
            }%
          }%
        }%
	\hrule%
        \openBox{8mm}{\frameWidth}{\parbox{\frameWidth}{　\abstractname}}
	\vss%
	\hrule%
      }%
      \vrule%
    }%
    \vss%
  }%
  \vspace*{-175mm}%
  \list{}{%
    \setlength{\leftmargin}{8mm}%
    \setlength{\rightmargin}{\leftmargin}%
  }%
  \item\relax%
\fi
}{\endlist}



%%%
\endinput
