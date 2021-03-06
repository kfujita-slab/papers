%%
%% $BD9:jBg3X(B $BO@J8MQ%9%?%$%k%U%!%$%k(B
%% 
%%       by shibata@cis.nagasaki-u.ac.jp Feb. 03, 2015
%%
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{nagasaki}[2017/02/03 $BD9:jBg3XB4O@!&=$O@(B]
\LoadClass[a4j,11pt]{jreport}

%%
%% $B=$O@%*%W%7%g%s(B
%%
\newcommand{\@master}{0}
\DeclareOption{master}{\renewcommand{\@master}{1}}
\DeclareOption*{\PassOptionsToPackage\CurrentOption{nagasaki}}
\ProcessOptions

%%
%% $B2$J8!&OBJ84V$N%9%Z!<%9(B
%%
\setlength{\xkanjiskip}{0.25em plus 0.15em minus 0.06em}

%%
%% $BI=Bj(B
%%
\renewcommand{\abstractname}{$BO@J8FbMF$NMW;](B}
\renewcommand{\bibname}{$B;29MJ88%(B}
\renewcommand{\listfigurename}{$B?^L\<!(B}
\renewcommand{\listtablename}{$BI=L\<!(B}
\renewcommand{\appendixname}{$BIUO?(B}

%%
%% $BL\<!$dI=L\<!$J$I$N@hF,%Z!<%8(B
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
%% float$B?^I=$N@)8f4X78(B
%%
\renewcommand{\topfraction}{.8}
\renewcommand{\textfraction}{.1}
\renewcommand{\floatpagefraction}{.6}

%%
%% $B6XB'=hM}4X78(B
%%
\prebreakpenalty\jis"2147=10000      % 5000   $B!G(B
\postbreakpenalty\jis"2148=10000     % 5000   $B!H(B
\prebreakpenalty\jis"2149=10000      % 5000   $B!I(B
\inhibitxspcode`$B")(B=2

%% 
%% $B8+=P$7$N%U%)%s%H(B
%%
\def\headerfont{\bfseries}

%%
%% $B>O(B
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
%% $B%Z!<%8>eIt$NCl4X78(B
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
%% text$BMQJ,?t(B
%%
\newcommand{\FRAC}[2]{\leavevmode\kern.1em%
  \raise.5ex\hbox{\the\scriptfont0 #1}\kern-.1em%
  /\kern-.15em\lower.25ex\hbox{\the\scriptfont0 #2}}

%%
%% $BI=;f(B
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
     \underline{\LARGE $B=$!!;N!!O@!!J8(B} 
     \else
     \underline{\LARGE $BB4!!6H!!O@!!J8(B} 
     \fi
     \vss
  }
  \vbox to1cm{\underline{$BBj!!!!L\(B}\vss}
  \vbox to4.0cm{%
    \centering \parbox{14cm}{\centering \huge \headerfont \@title}
    \vss
  }
  \vbox to1zh{\underline{$B;XF3650w(B}\vss}
  \vbox to5.0cm{\centering \LARGE \@teacher\vss}
  \vbox to4.5cm{\centering \LARGE \@date\vss}
  \vbox to1.5cm{%
    \centering
    \ifnum\@master=1
	{\Large $BD9:jBg3XBg3X1!9)3X8&5f2J!!Am9g9)3X@l96>pJs9)3X%3!<%9(B}
    \else
	{\LARGE $BD9:jBg3X9)3XIt9)3X2J!!>pJs9)3X%3!<%9(B}
    \fi
    \vss
  }
  \vbox to1.0cm{\centering \Huge \@author \LARGE $B!J(B\@id$B!K(B\vss}
  \vss
}
\end{titlepage}
\setcounter{footnote}{0} \let\thanks\relax
\let\maketitle\relax}

%%
%% $BO@J8MW;](B
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
              $B@l(B $B96(B $BL>(B\\\vspace*{-2mm}{\footnotesize $B!J(B $B%3(B $B!<(B $B%9(B $BL>(B $B!K(B}}}%
	  \closedBox{\authorHeight}{\courseWidthB}{%
            \parbox{\courseWidthB}{\centering%
              $BAm9g9)3X@l96(B\\\vspace*{-2mm}{\footnotesize $B!J>pJs9)3X%3!<%9!K(B}}}%
	  \closedBox{\authorHeight}{\authorWidthA}{$B;a!!L>(B}%
	  \openBox{\authorHeight}{\authorWidthB}{\@author}%
	}%
	\hrule%
        \hbox{%
          \closedBox{\titleHeight}{\titleWidthA}{$BBj(B $BL>(B}%
          \openBox{\titleHeight}{\titleWidthB}{%
            \parbox{\titleWidthB}{%
              \centering%
              \@title
            }%
          }%
        }%
	\hrule%
        \openBox{8mm}{\frameWidth}{\parbox{\frameWidth}{$B!!(B\abstractname}}
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
        \flushright{\small $B>pJs9)3X%3!<%9(B~~}}}%
    \hbox{\vrule%
      \vbox to\frameHeight{%
	\hrule%
	\hbox{%
	  \closedBox{\authorHeight}{\courseWidthA}{$BMz(B $B=$(B $BHV(B $B9f(B}
	  \closedBox{\authorHeight}{\courseWidthB}{\@id}
	  \closedBox{\authorHeight}{\authorWidthA}{$B;a!!L>(B}%
	  \openBox{\authorHeight}{\authorWidthB}{\@author}%
	}%
	\hrule%
	\hbox{%
	  \closedBox{\titleHeight}{\titleWidthA}{$B8&(B $B5f(B $B<<(B $BL>(B}
	  \openBox{\titleHeight}{\titleWidthB}{\@lab}%
	}%
        \hrule%
        \hbox{%
          \closedBox{\titleHeight}{\titleWidthA}{$B8&(B $B5f(B $BBj(B $BL>(B}%
          \openBox{\titleHeight}{\titleWidthB}{%
            \parbox{\titleWidthB}{%
              \centering%
              \@title
            }%
          }%
        }%
	\hrule%
        \openBox{8mm}{\frameWidth}{\parbox{\frameWidth}{$B!!(B\abstractname}}
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
