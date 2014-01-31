\documentclass{beamer}

%-------------------------------------------------------------------------------
% C Preprocessor Directives

#include "pause.h"

%-------------------------------------------------------------------------------
% Packages

%-------------------------------------------------------------------------------
% Formatting (includes)

%include lecture.fmt

%-------------------------------------------------------------------------------
% Formatting

%-------------------------------------------------------------------------------
% Commands

%-------------------------------------------------------------------------------
% Code

%-------------------------------------------------------------------------------
% Title

\title{Theory of Programming and Types\\---Introduction---}

\author{Wouter Swierstra, Johan Jeuring}

\institute{Utrecht University}

\date[2014-02-03]{3 February, 2014}

%-------------------------------------------------------------------------------

\begin{document}

%-------------------------------------------------------------------------------
\begin{frame}

\titlepage

\end{frame}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\sectionframe{Who?}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\begin{frame}{State Your...}

\begin{itemize}
\item Name
\item Place of origin
\item Experience in programming and types (e.g. courses taken, projects)
\item Something we can remember about you
\end{itemize}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Outline}

\tableofcontents

\end{frame}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\sectionframe{Introduction to Concepts}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\begin{frame}{Principles of programming languages}

Back to 1973:

\pause

First POPL: the ACM SIGACT-SIGPLAN symposium on Principles of programming languages

\pause

\begin{itemize}
\item Deterministic parsing of ambiguous grammars
\item Programming language semantics and closed applicative languages
\item Types are not sets
\item Recursively defined data types
\item Advice on structuring compilers and proving them correct
\item Reasoning about programs
\end{itemize}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Programming and types}

Structuring data (types) and manipulating data (programming) are fundamental 
components of Computer Science.

\begin{itemize}
\item How can types help a programmer?
\item Can types express advanced properties of programs?
\item Can we use types to construct a program?
\item What is the meaning of a program, and its type?
\item What properties of types, programs, programming languages and types systems 
would we like to have?
\item How can we prove such properties? 
\end{itemize}
These are the kind of question we want to address in the course on theory of
programming and types.

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Themes}

The course is roughly divided into three themes:

\begin{itemize}
\item Dependently-typed programming in Agda
\item Generic programming
\item Semantics, type-systems, reasoning about types
\end{itemize}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Dependently-typed programming in Agda}

\begin{itemize}
\item A dependent type is a type that depends on a value
\item Example: lists of a particular length (aka vectors)
\item Dependent types are used to describe very precise properties of programs
\item Several implementations, we will use Agda
\end{itemize}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Generic programming}

\begin{itemize}
\item A generic program is a program that depends on (the structure of) a type
\item Example: equality of values
\item Generic programs implement common programming patters and reduce code duplication
\item Several implementations
\end{itemize}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Semantics, type systems, and their properties}

\begin{itemize}
\item There are several ways to describe the semantics of a program: denotational, 
operational, big-step, small-step etc.
\item The semantics depends on many aspects, such as call by value parameter passing, 
call by name, lazy evaluation, ...
\item How do we set up a type system for a programming language?
\item Can we show that a type doesn't change when a value is evaluated?
\end{itemize}

\end{frame}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\sectionframe{The course}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\begin{frame}{Intended learning objectives}

\begin{enumerate}
\item Program in a dependently typed programming language such as Agda
\item Prove properties of programs and systems using a dependently typed 
programming language such as Agda
\item Design and write datatype generic programs, for example by using a 
universe construction in Agda, but also by using fixed-points 
\item Design a type system for a programming language
\item Formulate and prove properties of such a type system
\item Read, present, and use results from papers from the important conferences 
in the field, such as the Symposium on Principles of Programming Languages (POPL), and International Conference of Functional Programming (ICFP). This course will prepare you to to contribute to research in this area.
\end{enumerate}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Mode of working}

\begin{itemize}
\item Three blocks of two weeks (dependently typed programming, generic programming, semantics)
\item Each block: approximately 3 lectures, one reading session (mainly classic papers), concluded with an exercise set
\item 4 weeks of reading sessions and project work
\item presentation of projects
\end{itemize}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Assessment of exercise sets}

Self- and peer-assessment. 

\begin{itemize}
\item Provide practice with assessment
\item Develop skills for judging the quality of solutions
\end{itemize}

PAUSE
Process
\begin{enumerate}
\item Submit solutions
\item Lecturer distributes ``gold standard'' and student solutions
\item Assess own solutions and those of fellow student
\item Submit assessment of fellow student with grade and comments
\item Lecturer distributes grades and comments
\item The result contributes 40\% to the final grade
\end{enumerate}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Assessment of reading sessions}

\begin{itemize}
\item Pick a paper
\item Briefly introduce a paper at a reading session, and lead the ensuing discussion, going through the paper
\item Assessment based on: 
\begin{itemize}
	\item introduction of the paper
	\item analysis of the results
	\item raising questions
	\item leading the discussion
\end{itemize}
\item The result contributes 20\% to the final grade
\end{itemize}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Papers}
\begin{itemize}
\item John Launchbury; A natural semantics for Lazy Evaluation
\item Jeremy Gibbons, Graham Hutton, Thorsten Altenkirch; When is a function a fold unfold
\item Erik Meijer, Maarten Fokkinga, Ross Patterson; Functional Programming with Bananas, Lenses, Envelopes and Barbed Wire
\item Rod Burstall; Proving properties of programs by structural induction
\item Jean-Louis Krivine, Call-by-name lambda-calculus machine
\item Nils Anders Danielsson; Operational semantics using the partiality monad
\item Robby Findler and Matthias Felleisen; Contracts for Higher-order functions
\item Luca Cardelli and Peter Wegner; On understanding types, data abstraction, and polymorphism
\end{itemize}
\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Research Project}

Goals
\begin{itemize}
\item Develop problem solving and evaluation skills
\item Test critical thinking skills
\item Provide practice with teamwork
\item Provide practice with writing research papers
\end{itemize}

PAUSE
Research project process
\begin{itemize}
\item Pick a project from the ideas provided, or an interesting research question (approved by lecturer) to answer
\item Present research approach, results, relationship to course material, analysis, etc.
\item Submit (via email) to lecturer a report describing your project
\item Grading based on research approach, critical analysis, presentation style, and quality of report
\item The result contributes 40\% to the final grade
\end{itemize}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Projects}

\begin{itemize}
\item Generic contracts
\item Semantics of effects
\item Verified compilers
\item Contract inference
\item Generic function inference
\item Optimising generics using Coq
\item ...
\end{itemize}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Contact}

\begin{itemize}
\item Course URL: \url{http://www.cs.uu.nl/education/vak.php?stijl=2&vak=INFOMTPT} 
\item Email: \href{mailto:W.S.Swierstra@@uu.nl}{W.S.Swierstra@@uu.nl} or \href{mailto:J.T.Jeuring@@uu.nl}{J.T.Jeuring@@uu.nl}
\item Office: BBL 571/572
\end{itemize}

\end{frame}
%-------------------------------------------------------------------------------

\end{document}

%-------------------------------------------------------------------------------
\begin{frame}{``Generic'' Examples}

\begin{question}
What are examples of generic programming?
\end{question}

\begin{columns}

\column{.48\textwidth}
PAUSE
\begin{itemize}
\item Ada generic packages
\item Eiffel, Java, .NET generic classes
\item C++ templates
\end{itemize}

\column{.48\textwidth}
PAUSE
Also...
\begin{itemize}
\item Clean
\item Generic Haskell
\end{itemize}

\end{columns}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Datatype-Generic Programming}

\begin{question}
What does \alert{datatype-generic} mean?
\end{question}

PAUSE
Also known as
\begin{itemize}
\item Polytypism
\item Shape- or Structure-polymorphism
\end{itemize}

PAUSE
We will answer this question throughout the course.

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Structuring Data}

\begin{question}
Why/where does the structure of data matter?
\end{question}

PAUSE
\begin{itemize}INCREMENT
\item model of class/entity relationships (e.g. UML)
\item schema for a database
\item DTD or Schema for XML
\item grammar for computer languages
\item datatype for functional programming
\end{itemize}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Separating Concerns}

\begin{block}{Separating Functionality from Structure}
\begin{description}[Functionality]
\item[\alert{Structure}] - relationships between the elements of the data
\item[\alert{Functionality}] - operations on data
\end{description}
\end{block}

PAUSE
\begin{block}{Separating Functionality}
\begin{description}[Datatype-specific]
\item[\alert{Datatype-specific}] - operations for which the datatype was designed
\item[\alert{Datatype-generic}] - operations that apply to whole classes of datatypes
\end{description}
\end{block}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Datatype-Generic Patterns}

\begin{block}{Working with changing datatypes}
As you develop your software, you may need to update your datatypes. You want to
reduce the amount of work involved in each update.
\end{block}

PAUSE
\begin{block}{Consuming, producing, or transforming values}
You want to perform an operation on a value that is highly dependent on the
structure of the datatype and not on the particular elements involved. Think
equality, |map|, pretty-printing, parsing, de-/compression, etc.
\end{block}

PAUSE
\begin{block}{Traversing the structure of a value}
Given a (possibly large) value, you want to collect a number of elements or
perform operations at certain locations, ignoring the rest.
\end{block}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Example of Software Evolution}

\begin{block}{\href{http://www.tei-c.org/}{Text Encoding Initiative}}
TEI ``develops and maintains a standard for the representation of texts in
digital form.'' They release Guidelines defining ~500 different textual
components and concepts (word, sentence, character, glyph, person, etc.),
expressed using a markup language.
\end{block}

PAUSE
TEI Guidelines releases
\begin{itemize}
\item P1 (Jun 1990): First draft
\item P3 (May 1994): First official (used SGML)
\item P4 (Jun 2002): Adapted to XML
\item P5 (Nov 2007): Major overhaul
\item After P5: Maintenance/feature release every 6 months
\end{itemize}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Datatype-Generic Programming in Haskell}

You have already used it:
\begin{itemize}
\item |deriving (Read, Show, Ord, Eq)|
\item |class Functor, Foldable, Traversable|
\item QuickCheck
\item Scrap Your Boilerplate (SYB)
\end{itemize}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Why {\it Not} Use Datatype-Generic Programming?}

Reasons
\begin{itemize}
\item You don't use Haskell, Clean, etc.
\item You don't want to download, install, and use external tools/libraries.
\item It can have a significant learning curve.
\item You don't know how to choose between the many approaches.
\end{itemize}

PAUSE
After this course, these won't be problems for you.

\end{frame}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\sectionframe{Course Information}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\begin{frame}{Course Components}

Main components
\begin{itemize}
\item Almost 10 Lectures
\item 3 Exercise sets: self- and peer-assessed (individual)
\item 3 Quizzes after the exercise sets (individual)
\item Research paper presentation (individual)
\item Research project: presentation and report (group)
\item Final exercise set
\end{itemize}

PAUSE
Literature: \url{http://www.cs.uu.nl/wiki/bin/view/GP/Literature}
\begin{itemize}
\item Lecture notes from the 2008 Advanced Functional Programming Summer School
(AFP2008)
\item Relevant research papers
\end{itemize}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Lectures}

See schedule: \url{http://www.cs.uu.nl/wiki/bin/view/GP/Schedule} \\~\\

PAUSE
Goals
\begin{itemize}
\item Introduce advanced datatypes and type system features
\item Cover a broad range of GP libraries
\item Show how to compare GP libraries
\item Introduce dependently typed programming for GP
\end{itemize}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Exercise Sets}

Exercise sets include programming and written exercises. You will have about a
week to do each. \\~\\

PAUSE
Goals
\begin{itemize}
\item Provide practical experience using GP libraries
\item Test understanding of GP concepts
\end{itemize}

PAUSE
Notes on Submitting
\begin{itemize}
\item Use a \textbf{single file} for each exercise set (i.e. not one file per exercise)
\item File format: \textbf{literate Haskell} (\href{http://www.haskell.org/onlinereport/literate.html}{haskell.org/onlinereport/literate.html})
\item File name: \(\langle First \rangle \langle Last \rangle \langle Exercise Num \rangle \mathtt{.lhs}\)
\begin{itemize}
\item e.g. \texttt{EdsgerDijkstra1.lhs} or \texttt{GuidoVanRossum2.lhs}
\end{itemize}
\item \textbf{Email} the file as an attachment to \href{mailto:leather@@cs.uu.nl}{leather@@cs.uu.nl}
\end{itemize}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Self- and Peer-Assessment}

Goals
\begin{itemize}
\item Provide practice with assessment
\item Develop skills for judging the quality of solutions
\end{itemize}

PAUSE
Process
\begin{enumerate}
\item Students submit solutions
\item Lecturer distributes ``gold standard'' and student solutions
\item Students assess own solutions and those of fellow student
\item Students submit assessment of fellow student with grade and comments
\item Lecturer distributes grades and comments
\item Submitting solutions to exercise sets is obligatory, but result does not count towards final grade
\end{enumerate}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Quizzes}

Goals
\begin{itemize}
\item Assess practical experience and understanding of GP concepts
\end{itemize}

PAUSE
Process
\begin{enumerate}
\item After you get the comments on your exercise set, we hand out a quiz
\item Answer the quiz in half an hour
\item The quizzes count towards your final grade
\end{enumerate}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Research Paper Presentation}

Goals
\begin{itemize}
\item Provide practice reading research papers
\item Provide practice with public speaking
\item Develop critical reading and analysis skills
\item Test understanding of GP concepts
\item Test creativity
\end{itemize}

PAUSE
Research paper process
\begin{itemize}
\item Pick an interesting paper (approved by lecturer) to read and present
\item Present research approach, results, relationship to course material, analysis, etc.
\item Include at least one interactive question for students
\item Submit (via email) to lecturer two exercise questions with solutions
\item Grading based on critical analysis, presentation style, and quality of submitted exercises
\end{itemize}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Research Project}

Goals
\begin{itemize}
\item Develop problem solving and evaluation skills
\item Test critical thinking skills
\item Provide practice with teamwork
\item Provide practice with writing research papers
\end{itemize}

PAUSE
Research project process
\begin{itemize}
\item Pick an interesting research question (approved by lecturer) to answer
\item Present research approach, results, relationship to course material, analysis, etc.
\item Submit (via email) to lecturer a report describing your project
\item Grading based on research approach, critical analysis, presentation style, and quality of report
\end{itemize}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Grading}

\begin{itemize}
\item Quizzes: |q = (q_1 + q_2 + q_3) / 3|
\item Research paper presentation + two exercises: |p|
\item Research project: |r|
\item Final exercise set: |e|
\item Final grade: |s = (2*q + 2*p + 4*r + 2*e) / 10|
\end{itemize}

\end{frame}
%-------------------------------------------------------------------------------
\begin{frame}{Intended learning outcomes}

\begin{enumerate}
\item Explain the role datatypes and generic programming (GP) play in
programming
\item Solve programming problems and improve programs using GP
\item Evaluate GP methods/approaches, and describe their merits and problems
\item Critically analyse GP research articles
\item Perform research on a GP-related problem, and present your results both
verbally and on paper
\end{enumerate}

\end{frame}

