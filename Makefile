# fixme variable expansion unix (docker) or make
LOCAL_RESOURCE=tmp/$(COURSE).zip
REMOTE_RESOURCE=https://www.$(DOMAIN)/$(COURSE)
default: todo

build:
	docker build -t $$DOMAIN:latest .

run: build
	docker run -it \
		--env-file test/$(DOMAIN).test001.env \
		-v $(shell pwd)/tmp:/usr/app/tmp \
		-v $(shell pwd)/$(DOMAIN):/usr/app/$(DOMAIN) \
		-v $(shell pwd)/test:/usr/app/test \
		-v $(shell pwd)/bin:/usr/app/bin \
		$(DOMAIN):latest make

todo: tmp/$(COURSE) $(SECTIONS)
	echo $(SECTIONS)
	cat $(SECTIONS) > $@
	wc -l $@

{tmp,notes}:
	mkdir -p $@

%/$(COURSE): $(LOCAL_RESOURCE) tmp
	unzip -o $< -d $@

tmp/%.txt: tmp/$(COURSE)
	find tmp -type f -name *$** > $@

$(LOCAL_RESOURCE): $(DOMAIN)/fetch
	$< $@ $(REMOTE_RESOURCE)

tmp/%.txta%:
	find tmp -name *.txta

notes/%:
	sh todo.sh $@

.PHONY:

clean: .PHONY
	@echo "\ncleaning tmp/\n"
	@rm -rf $(SECTIONS)

tmp:
	mkdir -p $@

test: clean
	bats test/$$DOMAIN.bats

