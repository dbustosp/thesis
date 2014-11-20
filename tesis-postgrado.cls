\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{tesis-postgrado}[2013/10/27 v1.3 Estilo para tesis (Emir Munoz, con pequeñas modificaciones de Daniel Pavez)]
\newif\ifkeys\keysfalse
\newif\iftxfonts\txfontsfalse
\newif\iflogo\logofalse



\DeclareOption{keys}{\keystrue}
\DeclareOption{magister}{\magistertrue}
\DeclareOption{txfonts}{\txfontstrue}
\DeclareOption{logo}{\logotrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptions\relax

\LoadClass[twoside,12pt,letterpaper]{book}

%SUPLEMENTARIOS----------------------------------------------------------------
\RequirePackage[spanish]{babel}
\RequirePackage[utf8]{inputenc}
\ifkeys\RequirePackage[notref,notcite]{showkeys}\fi
%CONFIGURACIÓN HEADER Y FOOTER-------------------------------------------------
\RequirePackage{fancybox}
\RequirePackage{fancyhdr}
\RequirePackage{float}
%SÍMBOLOS Y FUENTES------------------------------------------------------------
\RequirePackage{amstext}
\RequirePackage{amssymb,latexsym}
\RequirePackage{amsfonts}
\RequirePackage{stmaryrd}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{marvosym}
\RequirePackage{textcomp}
\RequirePackage{mathcomp}
\RequirePackage{marvosym}
\RequirePackage{upgreek}
\usepackage{gensymb}
\usepackage{dsfont}
\iftxfonts\RequirePackage{txfonts}\fi
%ENTORNOS Y FIGURAS------------------------------------------------------------
\RequirePackage{verbatim}
\RequirePackage{fancyvrb}
\RequirePackage{enumerate}
%-----------------------------------------------IMÁGENES GNU Y PLOT
\RequirePackage{graphicx}
\RequirePackage{epsf}
\RequirePackage{psfrag}
\RequirePackage{epic,eepic}
\RequirePackage{subfigure}
\RequirePackage{color}
%-----------------------------------------------Referencias
\RequirePackage{hyperref}
\RequirePackage{url}
\RequirePackage[all]{hypcap}
%------------------------------------------------Tablas
\RequirePackage{colortbl}
\RequirePackage{multirow}
\RequirePackage{array}
\RequirePackage{caption}
\captionsetup[table]{position=top,belowskip=4pt,aboveskip=4pt}
\RequirePackage{longtable}
\RequirePackage{lscape}
%------------------------------------------------Apendice y tabla de contenidos
\RequirePackage{appendix}
\RequirePackage[nottoc]{tocbibind}
%------------------------------------------------Algoritmos
\RequirePackage[ruled,algochapter,linesnumbered]{algorithm2e}
\renewcommand{\algorithmcfname}{Algoritmo}
\RequirePackage{algorithmic}
\setlength{\algomargin}{1em}
\renewcommand{\algorithmicrequire}{\textbf{Entrada:}}
\renewcommand{\algorithmicensure}{\textbf{Salida:}}
\renewcommand{\algorithmiccomment}[1]{//#1}
%------------------------Configuracion indice de algoritmos
\renewcommand{\listofalgorithms}{
    \begingroup
    \tocfile{\'Indice de Algoritmos}{loa}
    \endgroup
}
%--------Package para la numeracion
\RequirePackage{thesis_em}
%--------Listing de código
\RequirePackage{listings}
%\lstset{ 
%    %language=[Visual]C++,
%    language=java,
%    frame=Ltb,
%    framerule=0pt,
%    aboveskip=0.2cm,%0.5cm
%    framextopmargin=1pt, %3pt
%    framexbottommargin=1pt, %4pt
%    framexleftmargin=0cm,
%    framesep=0pt,
%    rulesep=.4pt,
%    backgroundcolor=\color{gray97},
%    rulesepcolor=\color{black},
%    %
%    stringstyle=\ttfamily,
%    showstringspaces=false,
%    basicstyle=\scriptsize\ttfamily, %\small \scriptsize
%    commentstyle=\color{gray45},
%    keywordstyle=\bfseries,
%    %
%    numbers=left,
%    numbersep=4pt,%15pt
%    numberstyle=\tiny,
%    numberfirstline=false,
%    breaklines=true,
%    %
%    tabsize=4,
%    upquote=true,
%    extendedchars=true,
%    morecomment=[s]{/**\<}{*/},
%    morecomment=[s]{/*}{*/},
%%    morekeywords={¿,?},
%}
% % MODIFICADO PARA COLOCAR CÓDIOGO JAVA
\usepackage{listings}
\usepackage{color}

\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}
\lstset{frame=single,
  captionpos=b, 
  language=Java,
  numbers=left,
  aboveskip=3mm,
  belowskip=3mm,
  showstringspaces=false,
  columns=flexible,
  basicstyle={\small\ttfamily},
  %numbers=none,
  numberstyle=\tiny\color{gray},
  keywordstyle=\color{blue},
  commentstyle=\color{dkgreen},
  stringstyle=\color{mauve},
  breaklines=true,
  breakatwhitespace=true,
  tabsize=3
}

\usepackage{color}
\definecolor{gray97}{gray}{.97}
\definecolor{gray75}{gray}{.75}
\definecolor{gray45}{gray}{.45}
% minimizar fragmentado de listados
\lstnewenvironment{listing}[1][]
    {\lstset{#1}\pagebreak[0]}
    {\pagebreak[0]}
\lstloadlanguages
{
    HTML
}
\lstdefinestyle{consola}
{
    basicstyle=\scriptsize\bf\ttfamily,
    backgroundcolor=\color{gray75},
}
%------------------------------------------------BIBLIOGRAFÍA
%\RequirePackage{apacite}
\RequirePackage{natbib}
\RequirePackage{tocbibind}
\RequirePackage[fixlanguage]{babelbib}
\selectbiblanguage{spanish}
\bibpunct{(}{)}{;}{}{,}{,}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}
%--------
\newenvironment{prueba}[1][Demostraci\'on]
{
    \begin{trivlist}
    \item[\hskip \labelsep {\bfseries #1}]
}{\end{trivlist}}

\renewcommand{\qed}
{   
    \nobreak \ifvmode \relax \else
    \ifdim\lastskip<1.5em \hskip-\lastskip
    \hskip1.5em plus0em minus0.5em \fi \nobreak
    \vrule height0.75em width0.5em depth0.25em\fi
}
%================================================================
% Notaciones Generales
%================================================================
\newcommand{\textrev}[1]{\textbf{#1}}
\newcommand{\emphrule}[1]{\emph{#1}}
\newcommand{\normlen}[1]{\ensuremath{\left |#1\right |}}
%----------------------------------------------------------------
\newcommand\ie{i.e.\@\xspace}
\newcommand\eg{e.g.\@\xspace}
\newcommand\cf{cf.\@\xspace}
\newcommand\ds{\slash\hspace*{-.6ex}\slash}
\newcommand{\bra}[1]{[\hspace{-.4ex}[#1]\hspace{-.4ex}]}
%================================================================
% Definición del estilo del header y footer
%================================================================
\lhead{\chaptername \thechapter. \chaptermark}
\chead{}
\rhead{\thepage}
\cfoot{}
\fancyheadoffset[LE,RO]{0cm}
% Cambios al default de spanish
\deactivatetilden
\decimalpoint
% Headings
\markboth{}{}
% Renombre de los titulos por defecto
\addto\captionsspanish
{
    \def\bibname{Referencias}
    \def\contentsname{\'Indice de Contenidos}
    \def\listfigurename{\'Indice de Figuras}
    \def\listtablename{\'Indice de Tablas}
    \def\listalgorithmname{\'Indice de Algoritmos}
    \def\appendixname{Ap\'endice}
    \def\tablename{TABLA}
    \def\figurename{FIGURA}
    \def\chaptername{Cap\'itulo}
}
\renewcommand{\appendixname}{Apéndices}
\renewcommand{\appendixtocname}{Apéndices}
\renewcommand{\appendixpagename}{Apéndices}
%--------
\usepackage[compact]{titlesec} % CAPÍTULO X. AA
\titleformat{\chapter}
{\bfseries\Large\vspace*{-3.27cm}}
{\filright \Large\MakeUppercase\chaptertitlename\ \thechapter.\ }{0pt}{\filright\MakeUppercase}
[\vspace*{-0.6cm}]
%--------
\titleformat{\section} % X.Y AB
{\bfseries\large\vspace{1.65cm}}
{\large\MakeUppercase\thesection\ \vspace{6pt}}{0pt}{\MakeUppercase}
[\vspace*{1.08cm}]
%--------
\titleformat{\subsection} % X.Y.Z Ac
{\bfseries\normalsize\vspace{1.3cm}}{\normalsize\thesubsection\ }{0pt}{}
[\vspace*{1.08cm}]
%--------
\titleformat{\subsubsection} % X.Y.Z.W Ad
{\itshape\normalsize\vspace{2cm}}{\itshape\thesubsubsection\ }{0pt}
{\vspace*{1.2cm}\itshape}
%--------
\titlespacing*{\chapter} {0pt}{80pt}{60pt} 
\titlespacing*{\section} {0pt}{6.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing*{\subsection} {0pt}{6.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\titlespacing*{\paragraph} {0pt}{3.25ex plus 1ex minus .2ex}{1em}
\titlespacing*{\subparagraph} {\parindent}{3.25ex plus 1ex minus .2ex}{1em}
%-------------------------------- MÁRGENES SEGÚN REGLAMENTO: IZQ=INF=3cm Y SUP=DER=2cm
\RequirePackage[papersize={22cm,27cm},top=2.00cm, bottom=3.60cm, left=3.00cm,right=2.00cm,nohead,nofoot]{geometry}
%--------Otros márgenes
\setlength{\parindent}{1cm} %Sangría de cinco espacios
\setlength{\headsep}{13pt} %Espacio entre la parte superior y el límite de la hoja
\setlength{\voffset}{0.0cm} %Margen extra al lado superior de la página (vertical)
\setlength{\hoffset}{0.0cm} %Margen extra al lado derecho de la página (horizontal)
\setlength{\footskip}{10pt} %Espacio extra entre el fin de la página y el texto inferior
%--------Evitar que corte las palabras al final
\setlength{\pretolerance}{2000}
\setlength{\tolerance}{3000}
%--------
\newcommand{\paginaenblanco}{\newpage{\pagestyle{empty}\cleardoublepage}}
%--------Referenciacion en la forma: 1-5
\newcommand{\lref}[2]{\ref{#1}--\ref{#2}}
%--------Referenciacion en la forma:  (1)
\newcommand{\cref}[1]{(\ref{#1})}
%--------Referenciacion en la forma:  (1)-(5)
\newcommand{\clref}[2]{(\ref{#1})--(\ref{#2})}
%--------Otras referencias
\newcommand{\Ref}[1]{Ref.\ \cite{#1}}
\newcommand{\dRef}[2]{Refs.\ \cite{#1},\cite{#2}}
%================================================================
% Comandos matemáticos
%================================================================
% Parte real e imaginaria
\newcommand{\Real}{\mbox{Re }}
\newcommand{\Imag}{\mbox{Im }}
% Mayor/menor o igual y aproximado
\newfont{\msamfnt}{msam10}
\newcommand{\msam}[1]{\mbox{ \msamfnt #1}\ }
\newcommand{\simgeq}{\msam \&}
\newcommand{\simleq}{\msam .}
%--------Abreviaciones
\newcommand{\Capt}[1]{Cap.\ \ref{#1}}
\newcommand{\Fig}[1]{Fig.\ \ref{#1}}
\newcommand{\Sec}[1]{Sec.\ \ref{#1}}
%--------Otros
\newcommand{\salto}{\vspace{.5cm}}
%================================================================
% CARÁTULA Y PORTADA
%================================================================
\def\@title{}
\def\@autor{}
\def\@fecha{}
\def\@profesorguia{}
\def\@profesorcoguia{}
\def\@ciudad{}
\def\@pais{}

\newcommand{\keywords}[1]{\def\keywords{#1}}

\def\titulo#1{\gdef\@title{\begin{center}{\LARGE\bf#1}
\end{center}}\gdef\@titleMay{\begin{center}{\LARGE\bf\capitalize{#1}}
\end{center}}}

\def\autor#1{\gdef\@autor{{\bfseries #1}}\gdef\@autorn{#1}}

\def\fecha#1#2#3#4{\gdef\@diasemana{#1}\gdef\@diaexamen{#2}\gdef\@mesexamen{#3}%
\gdef\@annoexamen{#4}\gdef\@fecha{#3, #4}}

\def\profesorguia#1{\gdef\@profesorguia{#1}}
\def\profesorcoguia#1{\gdef\@profesorcoguia{#1}}

\def\regular#1{\gdef\@regular{#1}}
\def\externo#1{\gdef\@externo{#1}}
\def\presidente#1{\gdef\@presidente{#1}}

\def\ciudad#1{\gdef\@ciudad{#1}}

\def\pais#1{\gdef\@pais{#1}}

%--------------------------------------------------
\hypersetup
{
    bookmarksopen, bookmarksnumbered, pdfdisplaydoctitle=true,
    pdfborder=false,
    pdftitle=\@title,
    pdfauthor=\@autor,
    pdfsubject=Trabajo de T\'itulo,
    pdfkeywords=,
    pdfcreator=Universidad de Santiago de Chile,
    pdfproducer=Emir Mu\~noz,
    colorlinks=true,
    linkcolor=black,
    citecolor=black,
    filecolor=black,
    urlcolor=black,
    linkbordercolor={1 0 0},
    citebordercolor={0 1 0}
}

\newsavebox{\GradoTesis}
\newsavebox{\Gradotesis}
\newsavebox{\GradoOtorgado}
\newsavebox{\GradoOtorgadoTapa}

\savebox{\GradoTesis}{MAG\'ISTER}
\savebox{\Gradotesis}{Mag\'ister}
\savebox{\GradoOtorgado}{Mag\'ister en Ingenier\'ia Inform\'atica}
\savebox{\GradoOtorgadoTapa}{\large Mag\'ister en Ingenier\'ia Inform\'atica}
%--------------------------------------------------
\newcommand{\makecubierta}
{

\sloppy
\thispagestyle{empty}
\vspace*{-1.6cm}
\begin{center}
    {\bf \mbox{\large UNIVERSIDAD DE SANTIAGO DE CHILE}}\\
    {\bf \mbox{FACULTAD DE INGENIER\'IA}}\\
    {\bf \mbox{DEPARTAMENTO DE INGENIER\'IA INFORM\'ATICA}}\\
\end{center}
\vspace*{-3.6cm}
\hspace{15.3cm}
\begin{picture}(0,0)(38,120)
    \includegraphics[scale=.51]{images/LogoUsach.png}
\end{picture}


\vspace*{6.5cm}
\@titleMay\par
\vspace{0.9cm}
    {
        \large
        \begin{center}
        \vspace*{1cm}
        \capitalize{\@autor}\\

        \vspace*{1.5cm}
        \begin{flushleft}
        \normalsize
        \hspace{7.4cm} Profesor Gu\'ia: {\capitalize{\@profesorguia}}\\
        \hspace{7.4cm} Profesor Co-gu\'ia: {\capitalize{\@profesorcoguia}}\\
        
%        \vspace{1cm}
%        \hspace{7.4cm} Tesis de Grado presentado en conformidad\\
%        \hspace{7.4cm} a los requisitos para obtener el Grado de\\
%        \hspace{7.4cm} Mag\'ister en Ingenier\'ia Inform\'atica\\
        
        \vspace{1cm}
        \hspace{7.4cm} Trabajo de Titulac\'ion presentado en conformidad\\
        \hspace{7.4cm} a \space los \space requisitos \space para obtener \space el \space T\'itulo \space de\\
        \hspace{7.4cm} Ingeniero Civil Inform\'atico\\
        

        \end{flushleft}

        %\vspace*{1.9cm}
        \vspace*{1.7cm}
        \normalsize\MakeUppercase{\@ciudad\ de \@pais}\\
        \@annoexamen
        \end{center}\par
        \vspace{.9cm}
    }
}
%--------------------------------------------------
\newcommand{\makecopyright}
{
        \thispagestyle{empty}
        \vspace*{18cm}%\par
        \begin{flushleft}
        \copyright\ \@autor \\
        Se autoriza la reproducción parcial o total de esta obra, con fines académicos, por cualquier
        forma, medio o procedimiento, siempre y cuando se incluya la cita bibliográfica del documento.
        \end{flushleft}
}
% %COLOCADO POR RODRIG

%--------------------------------------------------
\newenvironment{dedicatoria}[1]
{
    \thispagestyle{empty}
    \vspace*{6cm}\par
    \hspace*{5cm}
    \begin{flushright}
    \textit{#1}
    \end{flushright}
}{}
%--------------------------------------------------
\newenvironment{gracias}
{
    \thispagestyle{empty}
    \begin{center}
        {\Large\bf AGRADECIMIENTOS}
    \end{center}
}{}
%--------------------------------------------------
\newcommand{\KeywordsES}[1]
{
    \par\noindent
    {\bf Palabras Claves\/}: #1
}
%--------------------------------------------------
\newcommand{\resumenCastellano}[1]
{
    \thispagestyle{empty}
    \begin{center}
        {\Large\bf RESUMEN}
    \end{center}
#1
}
%--------------------------------------------------
\newcommand{\KeywordsEN}[1]
{
    \par\noindent
    {\bf Keywords\/}: #1
}
\newcommand{\resumenIngles}[1]
{
    \thispagestyle{empty}
    \begin{center}
        {\Large\bf ABSTRACT}
    \end{center}
#1
}
%--------------------------------------------------
\newenvironment{glosario}
{
    \begin{center}
        \textbf{\Large GLOSARIO}
    \end{center}
}{}

\endinput


