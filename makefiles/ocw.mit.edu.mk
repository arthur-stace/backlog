OCW_ZIP_DOMAIN = https://ocw.mit.edu/ans15436/ZipForEndUsers

tmp/notes:
	mkdir -p $@

tmp/${COURSE}:
	mkdir -p $@


tmp/${COURSE}.zip: tmp/${COURSE}
	curl --output $@ \
		${OCW_ZIP_DOMAIN}/${COURSE_PREFIX}/${COURSE}/${COURSE}.zip
	tar xf $@ -C $<


tmp/%.txt: tmp/${COURSE}.zip .PHONY
	cat tmp/${COURSE}/${COURSE}/contents/$*/index.htm \
	| pup "#course_inner_section" \
	| lynx -list_inline -dump -stdin \
	| makefiles/ocw.mit.edu/$*.sh

