include ocw.mit.edu.mk
include github.mk

default: etc/github apts

etc/github: etc/github/trekhleb/javascript-algorithms

clean:
	rm -f apts
	rm -f notes/*
