default: todo

todo: nltk.org/model
	@for entry in $(shell ls tmp/*.txta*); do echo "[0]>`shasum $$entry`" >> $@; done
	md5 todo

todo/model:

nltk.org/model: $(COURSE_SECTIONS)
	for entry in $?; do $@ $$entry; done

tmp:
	mkdir -p tmp

tmp/%.txt: tmp
	curl https://www.$$DOMAIN/book/$*.html \
	| lynx -dump -stdin > $@

notes:
	mkdir -p $@

notes/%:
	sh todo.sh $@

clean:
	rm -rf {tmp,notes}/* todo

.PHONY:

test: clean .PHONY
	bats test/backlog.bats

