ROOT = tmp/7-02-spring-2005/7-02-spring-2005

documentation:
	plantuml docs/*.uml
	open docs/*.png

.PHONY:

apts: .PHONY

tmp/apts: tmp/recitations.txt tmp/labs.txt tmp/lectures.txt tmp/exams.txt
	mkdir -p $@
	sh scripts/apts.sh $?
	mv x* $@/

tmp/notes: tmp/apts
	mkdir -p $@
	sh scripts/notes.sh $^ $@ > apts
	mv $@/* notes/

tmp/%.txt:
	cat ${ROOT}/contents/$*/index.htm \
	| pup "#course_inner_section" \
	| lynx -list_inline -dump -stdin > $@

clean:
	rm -rf tmp/{x*,notes,apts}
