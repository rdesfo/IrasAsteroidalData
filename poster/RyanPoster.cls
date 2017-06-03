% \iffalse meta-comment

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{RyanPoster}[2010/12/13 HMC Mathematics LaTeX poster class]

%%% Declare and set some options.

%% Set up ifs for Poster.
\newif\if@thesis
\@thesisfalse

%% Providing the clinic and thesis document-class options.
\DeclareOption{thesis}{\@thesistrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
%\ExecuteOptions{}
\ProcessOptions

\LoadClass{article}

%% Set some dimensions for layout.
\setlength{\paperwidth}{44in}
\setlength{\paperheight}{40in}
\setlength{\textwidth}{41in}
\setlength{\textheight}{37in}
\setlength{\topmargin}{0.5in}
\setlength{\oddsidemargin}{0.5in}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\topmargin}{0.5in}
\setlength{\headheight}{4in}
\setlength{\headsep}{1.75in}
\setlength{\footskip}{1in}
\setlength{\voffset}{0pt}
\setlength{\hoffset}{0pt}

%% Require some packages.
\RequirePackage{ifthen}
\RequirePackage{mathpazo}
\RequirePackage[scaled=0.95]{helvet}
\renewcommand{\ttdefault}{pcr}
\RequirePackage{sectsty}
\RequirePackage[font=small,font=sf,labelfont=bf]{caption}[2005/06/28]
\RequirePackage{graphics}
\RequirePackage{color}
\definecolor{hmcgold}{cmyk}{0,0.2,0.5,0.3}
\definecolor{black}{rgb}{0,0,0}
\definecolor{dkblue}{rgb}{0,0,0.47}
\definecolor{green}{rgb}{0,1,0}
\RequirePackage{multicol}
\setlength{\columnsep}{1in}
\setlength{\columnseprule}{2pt}

%% Redefine the named font sizes so we can keep most of the code
%% intact whilst still having larger type.

\renewcommand{\LARGE}{\fontsize{64pt}{72pt}\selectfont}
\renewcommand{\Large}{\fontsize{48pt}{60pt}\selectfont}
\renewcommand{\large}{\fontsize{36pt}{44pt}\selectfont}
\renewcommand{\normalsize}{\fontsize{30pt}{36pt}\selectfont}
\renewcommand{\small}{\fontsize{24pt}{30pt}\selectfont}
\renewcommand{\footnotesize}{\fontsize{18pt}{24pt}\selectfont}

%%% Set up the header.

\newlength{\ignored@length}
\newcommand{\set@ess}[1]{%
  \renewcommand{\and}{%
    \global\def\@ess{s}%
  }%
  \global\def\@ess{}%
  \settowidth{\ignored@length}{#1}
}
\newcommand{\@andcommaspace}{, }


%% Define a command to include the HMC Logo.
\DeclareRobustCommand{\@hmclogo}{%
  \begin{minipage}{9.5in}
    \resizebox{5in}{!}{\includegraphics{images/USM_logo.jpg}}
  \end{minipage}
}


%%% Set up the header for the poster.

%% Use fancyhdr.
\RequirePackage{fancyhdr}

%% Lay out the header
\pagestyle{fancy}
\fancyhf{}                      % Clear all fields.

%% For thesis.
\if@thesis
\fancyhead[L]{\raisebox{1in}{\@hmclogo}}
\fancyhead[R]{\resizebox{6in}{!}{\includegraphics{images/UCF.png}}}
\fi

%% For thesis
\if@thesis
\fancyhead[C]{%
  \begin{center}
    {\color{black}\Large\textsf{\@class}\\}%
    {\color{dkblue}\fontsize{100pt}{120pt}\selectfont\textsf{\textbf{\@title}}\\[0.25em]}
    {\color{black}\Large\textsf{\@author}\\[-0.5em]}
  \end{center}
}
\fi

%%% Colorize header and footer rules.
%%% This code taken from fancyhdr.sty; written by Piet van Oostrum.

\newcommand{\@rulecolor}{hmcgold}

\if@thesis
\renewcommand{\@rulecolor}{dkblue}
\fi

\renewcommand{\footrule}{{\color{\@rulecolor}\if@fancyplain\let\footrulewidth\plainfootrulewidth\fi
    \vskip-\footruleskip\vskip-\footrulewidth
    \hrule\@width\headwidth\@height\footrulewidth\vskip\footruleskip}}
\renewcommand{\headrule}{{\color{\@rulecolor}\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
    \hrule\@height\headrulewidth\@width\headwidth \vskip-\headrulewidth}}
%%% End code from fancyhdr.sty.


%%% Set color of vertical rules.
%%%
%%% This code is modified from the code in multicol.sty; written by
%%% Frank Mittelbach and part of standard LaTeX.
%%%
%%% It will probably break if the original routine is modified in
%%% future versions of multicol.sty, so be sure to check there.

\renewcommand{\page@sofar}{%
   \process@cols\mult@rightbox
       {\ifvoid\count@
          \setbox\count@\hbox to\hsize{}%
        \else
          \wd\count@\hsize
        \fi}%
   \mult@info\z@
    {Column spec:\MessageBreak
       (\the\multicol@leftmargin\space -->
        \the\full@width\space = \the\hsize
        \space x \the\col@number)%
     }%
\ifvmode\else\errmessage{Multicol Error}\fi
   \moveright\multicol@leftmargin
    \hbox to\full@width{%
     \process@cols\mult@gfirstbox{\box\count@
       \hss{\color{\@rulecolor}\vrule\@width\columnseprule}\hss}%
     \box\mult@rightbox
      \rlap{\phantom p}%
    }%
}
%%% End code from multicol.sty.

\setlength{\multicolsep}{\textheight}

\newenvironment{poster}{%
\thispagestyle{fancy}
%{\color{hmcgold}\rule{\textwidth}{2pt}}
\begin{multicols*}{2}
}%
{\end{multicols*}
}


\renewenvironment{figure}
               {\def\@captype {figure}}
               {}

\renewenvironment{table}
               {\def\@captype {table}}
               {}


%%% Make section headers sans-serif.

\allsectionsfont{\sffamily}

%%% Suppress section numbering.
\renewcommand{\@seccntformat}[1]{\relax}

\endinput
