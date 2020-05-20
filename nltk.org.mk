tmp/%.txt: .PHONY
	@lynx -dump -list_inline ${DOMAIN}/book/$*.html > $@
	@sh makefiles/nltk.org/exercises.sh $@ $*

clean:
	@rm -rf nltk_ch*
