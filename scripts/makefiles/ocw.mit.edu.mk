COURSE = 6-006-fall-2011

OCW_ZIP_DOMAIN = https://ocw.mit.edu/ans15436/ZipForEndUsers

CONTENTS = tmp/mit/6-006-fall-2011/contents


.PHONY:


default: apts


apts: tmp/schedule.txt
	lynx -dump $< \
	| pup 'td text{}' \
	| tail -n +4 \
	| split -p Unit
	mv x* tmp/
	${MAKE} lecture-notes
	${MAKE} lecture-videos
	echo "\nTODO: detect relevant supplimentary info from sources, add to tmp unit file, contruct calcurse appt"


lecture-notes: .PHONY
	cat ${CONTENTS}/lecture-notes/index.htm \
	| pup '#course_inner_section tr td' \
	| lynx -dump -stdin -list_inline \
	| split -p Unit
	sh ./scripts/append_unit.sh


lecture-videos: .PHONY
	cat ${CONTENTS}/lecture-videos/index.htm \
	| pup '#course_inner_section tr td' \
	| lynx -dump -stdin -list_inline \
	| split -p Unit
	sh ./scripts/append_unit.sh


tmp/schedule.txt: tmp/mit
	cat ${CONTENTS}/syllabus/index.htm \
	| pup '#course_inner_section' > $@
	cat ${CONTENTS}/calendar/index.htm \
	| pup '#course_inner_section table' > $@


tmp/mit: tmp/6-006-fall-2011.zip
	mkdir -p $@
	tar xf $< -C $@


tmp/6-006-fall-2011.zip:
	curl \
		--output $@ \
		${OCW_ZIP_DOMAIN}/6/${COURSE}/${COURSE}.zip


