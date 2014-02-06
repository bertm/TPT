# Slides

Lecture slides in this repository are contained in *Literate Haskell* (`.lhs`) or *Literate Agda* (`.lagda`) files that have to be processed before they can be viewed as a PDF presentation. This directory contains a Makefile that makes it easy for you to do so.

You will need to have the following software installed:

* lhs2tex
* latexmk
* pdflatex
* cpp
* (GNU) make
* GHC >= 6.8.1

### Generating PDF slides
To generate slides from one of the Literate Haskell or Agda programs, do the following in a terminal:

1. `cd` to this directory, e.g. `cd 2014/slides`
2. Run `make <target>` to compile the slides, where `<target>` is to be replaces with the name of the **resulting** PDF file (e.g. the target is `01-introduction.pdf` when compiling `01-introduction.lhs`). Literally, you are asking `make` to make this file for you :-)

To simply generate PDF files for all literate programs in this directory, run `make pdf`.

### Extracting code
In case you are only interested in the Haskell code fragments on the slides, you may also use `make <target>` where the target is a Haskell file (e.g. `make 01-introduction.hs`). When invoked this way, `make` will then extract the code for you.

To extract code from all Literate Haskell programs in the directory, run `make hs`.

### All of the above
Feeling lucky? Try to run just `make` or `make all` to generate slides for all literate programs in the directory, and extract code for all Literate Haskell programs.

## Help, my directory just exploded!
Both LaTeX and GHC have the tendency to create quite a few temporary files, but forget to clean up afterwards. To remove all such files, run `make clean`. If you are still bothered by the presence of those PDF files you just generated, run `make realclean` instead.

