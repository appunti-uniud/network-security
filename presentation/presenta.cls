\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{presenta}


\LoadClass[aspectratio=169,xcolor=table]{beamer}
% \LoadClass[aspectratio=169,xcolor=table,handout]{beamer}
\setbeamercovered{invisible}
\setbeamertemplate{frametitle continuation}{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% PACKAGES %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{kvoptions} % allows passing arguments to class options

\RequirePackage{geometry} % sets page geometry style
%\RequirePackage{titlesec} % easily modify appereance of chapters and sections
% \RequirePackage{titletoc} % easily modify appereance of tableofcontents

\RequirePackage{graphicx} % allow use of \includegraphics
\RequirePackage{float} % floating positioning for images, ..
\RequirePackage{caption} % provide captions (images, tables, ..)
\RequirePackage{subcaption} % provides subfigures and subcaptions

\RequirePackage[backend=biber,style=numeric,maxbibnames=99,doi=true,eprint=true,sorting=none]{biblatex} % bibliography management

% \RequirePackage[table]{xcolor} % provides common colornames, plus allows definition of custom colors % already loaded in beamer
\RequirePackage{tcolorbox} % creation of colored boxes

\RequirePackage{mathtools,amssymb} % math environments (equation, ..) and math symbols

\RequirePackage{tikz} % creation of tikz pictures
\usetikzlibrary{shadows,overlay-beamer-styles} % adds shadow and beamer options into tikz pictures
\RequirePackage{pgfplots} % extend tikz by adding plots
\pgfplotsset{compat=1.18} % sets pgfplots compat version

% \RequirePackage{xspace} %provides \xspace, which adds space if no punctuation follows the commands

\RequirePackage[figure,table]{totalcount} % get total occurences of figures and tables (used in TOC)

% \hypersetup{
% 	colorlinks=true,
%   % allcolors=fg,
%   linkcolor=darkviolet,
%   citecolor=blueb,
% 	bookmarksnumbered=true,
% 	bookmarksopen=true
% }

% \RequirePackage{booktabs} % rearrange column and line in tabular
\RequirePackage{tabularx}

\RequirePackage{ragged2e} % provides justification inside columns


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% BASIC CLASS OPTIONS %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Basic options without parameters
\newif\ifpresenta@pdfa
\DeclareOption{pdfa}{\presenta@pdfatrue} % class option pdfa
\newif\ifpresenta@light
\DeclareOption{light}{\presenta@lighttrue} % class option light
\ProcessOptions\relax

% Sets if the generated output should be a `pdfa`
\ifpresenta@pdfa
  \RequirePackage[a-1b]{pdfx} % generates pdfa output
  \RequirePackage[pdfa]{hyperref} % management of hyperlinks, plus autogeneration of bookmarks
\else
  \RequirePackage{hyperref} % management of hyperlinks, plus autogeneration of bookmarks
\fi




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% PARAMETERED CLASS OPTIONS %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% More complex options that allow passing strings
\SetupKeyvalOptions{prefix={presenta@}}
\DeclareStringOption[]{banner}[] % class option banner
\ProcessKeyvalOptions{presenta}\relax




%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%  FONTS  %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%

% Sets text to a light font.
% We firstly load `cmbright` that sets both text and math, to have a light math, matching the SopiaPro style.
% Then we overwrite the text font with SofiaPro.
\ifpresenta@light
  % Set font to use Computer Modern Bright (works also with pdfLatex)
  \RequirePackage{cmbright} % light version of Computer Modern (default LaTex font)

  % Set font to use SofiaPro (need LuaLatex/XeLatex engine)
  \RequirePackage{fontspec} % allow to specify custom font

  % Sets mono font i.e. typewriter
  \setmonofont[
      Path = fonts/Monofur/,
      UprightFont = *Regular,
      ItalicFont = *Italic,
      BoldFont = *Bold,
      Extension = .ttf
  ]{MonofurNerdFontMono-}

  % Sets sans serif font, used by Small caps or part of title/headers
  \setsansfont[
      Path = fonts/SofiaPro/,
      UprightFont = *ExtraLight.otf,
      SlantedFont = *ExtraLight-Italic.otf,
      ItalicFont = *ExtraLight-Italic.otf,
      %ItalicFont = FlorentiaExtraLight-Italic.ttf,
      BoldFont = *Medium.otf,
      BoldItalicFont = *Medium-Italic.otf,
  ]{SofiaPro}
  
  % Sets roman font i.e. default text font (called upright)
  \setmainfont[
      Path = fonts/SofiaPro/,
      UprightFont = *ExtraLight.otf,
      SlantedFont = *ExtraLight-Italic.otf,
      ItalicFont = FlorentiaExtraLight-Italic.ttf,
      BoldFont = *Medium.otf,
      BoldItalicFont = *Medium-Italic.otf,
  ]{SofiaPro}

  \newfontfamily\semiboldfont[
      Path = fonts/SofiaPro/,
      UprightFont = *Light,
      ItalicFont = *Light-Italic,
      Extension = .otf
  ]{SofiaPro}

\else
\fi





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% COLORS %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\definecolor{white}{HTML}{F5F5F5}
%\definecolor{black}{HTML}{1D1D1C}
\definecolor{graydark}{HTML}{484848}
\definecolor{lilla}{HTML}{B4B5EE}
\definecolor{purple}{HTML}{B4B5EE}
\definecolor{blue}{HTML}{98CEF3}
\definecolor{deepsea}{HTML}{123499}
\definecolor{pink}{HTML}{F7ABDC}
\definecolor{red}{HTML}{E95678}

\colorlet{accent}{lilla!160}
\colorlet{accentlight}{lilla!30}
\colorlet{accentmedium}{lilla!240}
\colorlet{accentdark}{lilla!320}


\usetheme{wildcat}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% PAGING %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \def\presenta@unisep{.5em}
% \def\presenta@se@and{.2ex}
% \def\presenta@se@qual{1ex}
% \def\presenta@se@sep{2em}
 
% \geometry{
%     hcentering,
%     bindingoffset=.025\paperwidth,
%     outer=.075\paperwidth,
%     nofoot,nomarginpar,
%     vdivide={.08\paperheight,*,.06\paperheight}
% }

% create storage for titles
% \newcommand{\chaptertitle}{}
% \newcommand{\sectiontitle}{}
% 
% % update stored chapter title whenever \chapter is used
% \renewcommand{\chaptermark}[1]{
%   \markboth{#1}{}
%   \renewcommand{\chaptertitle}{#1}
%   % reset section title when a new chapter starts
%   \renewcommand{\sectiontitle}{}
% }
% 
% % update stored section title whenever \section is used
% \renewcommand{\sectionmark}[1]{
%   \markright{#1}
%   \renewcommand{\sectiontitle}{#1}
% }
% 
% % custom definition of header
% \def\header{
%   \ifnum\value{section}=0
%     \MakeUppercase{\chaptertitle}
%   \else
%     \MakeUppercase{\chaptertitle} \ --- \ \textit{\sectiontitle}
%   \fi
% }
% 
% \let\ps@plain\ps@empty%
% 
% % new page style `presenta`
% \@namedef{ps@presenta}{
%   %\let\@oddfoot\@empty
%   %\let\@evenfoot\@empty
%   %\let\@mkboth\markboth
%   \def\@evenhead{\thepage\hfill{\footnotesize \textcolor{accentdark}{\header}}}%
%   \def\@oddhead{{\footnotesize \textcolor{accentdark}{\header}}\hfill\thepage}%
% }

% Capital letter when referring via \autoref
% \renewcommand{\chapterautorefname}{Chapter}
% \renewcommand{\sectionautorefname}{Section}
% \renewcommand{\subsectionautorefname}{Subsection}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% ENVIRONMENT %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\acknowledgements{\chapter*{\textcolor{accentmedium}{Acknowledgements}}}
\def\abstract{\chapter*{\textcolor{accentmedium}{Abstract}}\addcontentsline{toc}{chapter}{Abstract}}
\def\summary{\chapter{\textcolor{accentmedium}{Summary}}}

\newenvironment{titlelike}[1]{
    \cleardoublepage\thispagestyle{empty}
    \def\presenta@titlelike{#1}
    \vspace*{\z@\@plus.3fil}
    \begin{\presenta@titlelike}
}{
    \end{\presenta@titlelike}
    \vspace*{\z@\@plus.6fil}
    \newpage\thispagestyle{empty}
}

\newenvironment{dedication}{\begin{titlelike}{flushright}\begin{itshape}}{\end{itshape}\end{titlelike}}

\tcbuselibrary{skins}
% \tcbuselibrary{skins,listings,breakable}
\newtcolorbox{accentbox}[3][]{
  enhanced,
  attach boxed title to top left={xshift=3mm,yshift=-3mm,yshifttext=-1mm},
  colback=#3!30,
  colframe=#3!160,
  colbacktitle=white,
  coltitle=#3!240,
  coltext=black,
  arc=4mm,boxrule=2pt,
  title=\textbf{#2}\ifx#1\@empty \else : \textit{#1}\fi,
  halign=flush left,
  boxed title style={size=small,colframe=#3!160,arc=2mm}
}

% \newenvironment{definition}[1][]{\begin{accentbox}[#1]{Definition}{lilla}}{\end{accentbox}}
\newenvironment{noteee}[1][]{\begin{accentbox}[#1]{Note}{gray}}{\end{accentbox}}

% custom title body:
% chaptertitle <empty> bigchapternumber
% \newcommand{\chaptertitlemain}[1]{
%   #1
%   \hfill
%   {\fontsize{100}{60}\selectfont\textcolor{accent}{\thechapter}}
% }
% 
% \newcommand{\chaptertitleback}[1]{
%   #1
% }
% 
% \newcommand{\presentachaptermain}{
%   \titleformat{\chapter}[block]
%     {\huge\bfseries} % Format of the whole line
%     {} % Label
%     {0pt} % Separation between label and title body
%     {\chaptertitlemain} % title body
% }
% 
% \newcommand{\presentachapterback}{
%   \titleformat{\chapter}[block]
%     {\huge\bfseries} % Format of the whole line
%     {} % Label
%     {0pt} % Separation between label and title body
%     {\chaptertitleback} % title body
% }
% 
% \let\oldfrontmatter\frontmatter
% \renewcommand{\frontmatter}{
%   \pagestyle{empty}
%   \oldfrontmatter
% }
% 
% \let\oldmainmatter\mainmatter
% \renewcommand{\mainmatter}{
%   \pagestyle{presenta}
%   \oldmainmatter
%   \setcounter{page}{1}
%   \presentachaptermain
% }
% 
% \let\oldbackmatter\backmatter
% \renewcommand{\backmatter}{
%   \pagestyle{empty}
%   \oldbackmatter
%   \presentachapterback
% }




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%   TITLE   %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@date{
  \begingroup
    \expandafter\advance\expandafter\year\ifnum\month>3
      -1
    \else
      -2
    \fi
    \the\year-\advance\year1 \the\year
  \endgroup
}

\def\@banner{
  \ifx\presenta@banner\@empty
    \textcolor{white}{\rule{\textwidth}{40pt}}
  \else
    \@for\@ban:=\presenta@banner\do{\includegraphics[width=\textwidth]{banners/\@ban.pdf}\\}
  \fi
  \vfill
}

% Defines a new field 
\newcommand{\deffield}[1]{
  % Define storage macro \@<name> (empty initially)
  \expandafter\newcommand\csname @#1\endcsname{}
  % Define setter: \name{<value>} sets \@<name>
  \expandafter\newcommand\csname #1\endcsname[1]{
    \expandafter\gdef\csname @#1\endcsname{##1}
  }
}

% Define multiple fields by extending `\deffield`.
% Takes a comma-separated list as input
\newcommand{\deffields}[1]{
  \@for\@field:=#1\do{
    \expandafter\deffield\expandafter{\@field}
  }
}

% Simply prints the field value after printing the field name
\def\show#1{
  \if\csname @#1\endcsname\@empty
  \else
    \textcolor{accentdark}{\textsc{\csname #1name\endcsname}}\\
    \textit{\csname @#1\endcsname}\par
    \vskip2em\relax
  \fi
}

\newcount\@numitems

\newcommand{\countitems}[1]{
  \@numitems\z@
  \expandafter\@for\expandafter\@item\expandafter:\expandafter=\csname @#1\endcsname\do{\advance\@numitems\@ne}
}

% Alternative version of `show` that use a singular/plural version of the field name
% depending on the number of elements.
\def\shows#1{
  \if\csname @#1\endcsname\@empty
  \else
    \countitems{#1}
    \ifnum\the\@numitems>1
      \textcolor{accentdark}{\textsc{\csname #1name\endcsname s}}\\
    \else
      \textcolor{accentdark}{\textsc{\csname #1name\endcsname}}\\
    \fi
    \expandafter\@for\expandafter\entry\expandafter:\expandafter=\csname @#1\endcsname\do{
      \textit{\entry}\par
    }
    \vskip2em\relax
  \fi
}

% Custom field definitions
\deffields{overtitle}

% Field names
\def\authorname{Author}

\def\maketitle{
  \begin{titlepage}
    \noindent
    \begin{minipage}[t][\textheight][s]{\linewidth}
    	\sffamily
      {\@banner}
      \begin{center}
        {\textcolor{accentdark}{\textsc{\large \@overtitle}}\par}
        \vskip 1em\@plus1fill\relax
        {\fontsize{30}{20}\selectfont\bfseries\@title\par}
        \vskip 3em\relax
        {\textsl{\Large\semiboldfont \@subtitle}\par}
        \vskip 5em\@plus1fill\relax
        {\large\shows{author}}
        \par\vskip 1em\@plus1fill\relax
        {\large\@date}\par
      \end{center}
    \end{minipage}
  \end{titlepage}
  {
    \parindent\z@\relax
    \show{institutecontacts}
    \show{authorcontacts}
    \show{rights}
  }
  \rmfamily
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%   TOC   %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \contentsmargin{0cm}

% edit appereance of `part` inside toc
% \titlecontents{part}[-1pc]
% {
%   \addvspace{50pt}
% 	\begin{tikzpicture}[remember picture, overlay]
% 		\draw[fill=accent,draw=accent,rounded corners] (-4.5,-0.2) rectangle (-0.2,0.55);
%     \pgftext[left,x=-1.6cm,y=0.15cm]{\textcolor{white}{\Large\sc\bfseries Part}};
% 	\end{tikzpicture}
%   \large\sc\bfseries
% }
% {}
% {}
% {}

% edit appereance of `chapter` inside toc
% \titlecontents{chapter}[5pc]
% {
%   \addvspace{30pt}
%   \ifx\thecontentslabel\@empty
%     \begin{tikzpicture}[remember picture, overlay]
% 	  	\draw[fill=accent,draw=accent,rounded corners] (-3.5,-0.2) rectangle (-0.7,0.55);
%       \pgftext[left,x=-3.38cm,y=0.18cm]{\textcolor{white}{\Large\sc\bfseries Chapter}};
%     \end{tikzpicture}\large\sc\bfseries
%   \else
% 	  \begin{tikzpicture}[remember picture, overlay]
% 	  	\draw[fill=accent,draw=accent,rounded corners] (-3.5,-0.2) rectangle (-0.3,0.55);
%       \pgftext[left,x=-3.38cm,y=0.18cm]{\textcolor{white}{\Large\sc\bfseries Chapter\ \thecontentslabel}};
%     \end{tikzpicture}\large\sc\bfseries
%   \fi
% }
% {}
% {}
% {
%   \;\titlerule\;\large\sc\bfseries Page \thecontentspage
% 	\begin{tikzpicture}[remember picture, overlay]
% 		\draw[fill=black,draw=black] (4pt,0.2pt) rectangle (4,0.2pt);
% 	\end{tikzpicture}
% }
% 
% % edit appereance of `section` inside toc
% \titlecontents{section}[5pc]
% {\addvspace{2pt}}
% {\contentslabel[\thecontentslabel]{2pc}}
% {}
% {\hfill\small \thecontentspage}
% []
% 
% % edit appereance of `subsection` inside toc
% \titlecontents{subsection}[5pc]
% {\addvspace{2pt}}
% {\scriptsize$\bullet$\quad\small\slshape}
% {}
% {\hfill\small \thecontentspage}
% []
% 
% % edit appereance of `figure` inside toc
% \titlecontents{figure}[5pc]
% {\addvspace{2pt}}
% {\contentslabel[\thecontentslabel]{2pc}}
% {}
% {\hfill\small \thecontentspage}
% []
% 
% % edit appereance of `table` inside toc
% \titlecontents{table}[5pc]
% {\addvspace{2pt}}
% {\contentslabel[\thecontentslabel]{2pc}}
% {}
% {\hfill\small \thecontentspage}
% []
% 
% \renewcommand{\listoffigures}{
%   \let\cleardoublepage\clearpage
% 	\chapter*{
% 	  \vspace*{-20\p@}
% 	  \begin{tikzpicture}[remember picture, overlay]
% 		  \draw[fill=accent,draw=accent,rounded corners] (10,-0.65) rectangle (20,1);
% 		  \pgftext[right,x=16.7cm,y=0.2cm]{\color{white}\Huge\sc\bfseries List of Figures};
% 	  \end{tikzpicture}
%   }
%   \@starttoc{lof}
% }
% 
% \renewcommand{\listoftables}{
%   %\let\cleardoublepage\clearpage
% 	\chapter*{
% 	  \vspace*{-20\p@}
% 	  \begin{tikzpicture}[remember picture, overlay]
% 		  \draw[fill=accent,draw=accent,rounded corners] (10.5,-0.65) rectangle (20,1);
% 		  \pgftext[right,x=16.7cm,y=0.2cm]{\color{white}\Huge\sc\bfseries List of Tables};
% 	  \end{tikzpicture}
%   }
%   \@starttoc{lot}
% }
% 
% % move contents title on the right then prints TOC with figures and tables
% \renewcommand{\tableofcontents}{
% 	\chapter*{
% 	  \vspace*{-20\p@}
% 	  \begin{tikzpicture}[remember picture, overlay]
% 		  \draw[fill=accent,draw=accent,rounded corners] (12.2,-0.65) rectangle (20,1);
% 		  \pgftext[right,x=16.7cm,y=0.2cm]{\color{white}\Huge\sc\bfseries \contentsname};
% 	  \end{tikzpicture}
%   }
% 	\@starttoc{toc}
%   \iftotalfigures\listoffigures\fi
%   \iftotaltables\listoftables\fi
%   \clearpage
% }






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%   REFERENCES   %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\addbibresource{bib/abbrev0.bib}
\addbibresource{bib/main.bib}

\DeclareFieldFormat{title}{\mkbibquote{#1}} % applies quotes to title in all entry types (@Misc, was missing them)


\def\references{
  \begin{frame}[allowframebreaks]{References}
  \nocite{*} % adds all bibliography entries, even not cited
  \printbibliography[heading=none]
  \end{frame}
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%   COMMON SHORTCUTS   %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\ie}{\textit{i.e.}, }
\newcommand{\eg}{\textit{e.g.}, }
\newcommand{\st}{\textit{s.t.} }

\newcommand{\quoteinline}[1]{``\textsl{#1}''}
