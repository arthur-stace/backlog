default: todo

todo: tmp/$(COURSE) $(SECTIONS)
	@for entry in tmp/*.txt; do cat $$entry | grep -e $$READ_FILTER > $@; done
	@wc -l $@

{tmp,notes}:
	mkdir -p $@

%/$(COURSE): $(LOCAL_RESOURCE)
	tar xf $< -C $*

tmp/%.txt: tmp/$(COURSE)
	find tmp -name *.htm* \
	| grep $* \
	| xargs cat \
	| pup $$FETCH_FILTER \
	| lynx -dump -stdin -list_inline \
	> $@

$(LOCAL_RESOURCE): $(DOMAIN)/fetch
	$< $@ $(REMOTE_RESOURCE)

tmp/%.txta%:
	find tmp -name *.txta

notes/%:
	sh todo.sh $@

clean: .PHONY
	@echo "\ncleaning tmp/\n"
	@ls tmp | grep -v zip | xargs -I _ rm -rf tmp/_

.PHONY:

test: clean .PHONY
	bats test/*.bats

