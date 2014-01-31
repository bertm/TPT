
#-------------------------------------------------------------------------------
# Commands and programs

LHS2TEX         := lhs2TeX
LATEXMK		:= latexmk
GHC             := ghc
FORMAT          := format

# Enable pauses with `make <target> PAUSE=1'
ifeq ($(PAUSE), 1)
CPP_PAUSE       := -DDO_PAUSES=1
else
CPP_PAUSE       := -UDO_PAUSES
endif

CPP             := cpp -P $(CPP_PAUSE)

#-------------------------------------------------------------------------------
# File rules

$(FORMAT) : $(FORMAT).hs
	$(GHC) --make -o $@ $<

generated.fmt : $(FORMAT)
	./$(FORMAT) > $@

#-------------------------------------------------------------------------------
# Pattern rules

%.pdf : %.tex
	$(LATEXMK) -pdf $<

%.tex : %.lhs lecture.sty lecture.fmt generated.fmt pause.h
	$(CPP) $< | $(LHS2TEX) --file-directives --poly -slatex > $@

%.tex : %.lagda lecture.sty lecture.fmt generated.fmt pause.h
	$(CPP) $< | $(LHS2TEX) --agda --file-directives --poly -slatex > $@

%.hs : %.lhs lecture.fmt generated.fmt
	$(CPP) $< | $(LHS2TEX) --newcode -shscode > $@

#-------------------------------------------------------------------------------
# Other rules

clean :
	rm -f *~ *.aux *.bbl *.blg *.fls *.log *.vrb *.toc *.out *.nav *.snm *.rel *.mpx *.ptb *.fdb_latexmk *.pdfsync
	rm -f *.agdai
	rm -f *.tex
	rm -f $(FORMAT) $(FORMAT).o $(FORMAT).hi generated.fmt

realclean : clean
	rm -f *.pdf

#-------------------------------------------------------------------------------
# Other

.PHONY : clean realclean

# .SECONDARY :

