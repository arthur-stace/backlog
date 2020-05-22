# fixme variable expansion unix (docker) or make
LOCAL_RESOURCE=tmp/$(COURSE).zip
# fixme better project domain config
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
		$(DOMAIN):latest make $(SECTIONS)

todo: $(SECTIONS)

{tmp,notes}:
	mkdir -p $@

tmp/$(COURSE): $(LOCAL_RESOURCE)
	unzip -o $< -d $@

tmp/%.txt: tmp/$(COURSE)
	$(DOMAIN)/model $* > $@

$(LOCAL_RESOURCE): $(DOMAIN)/fetch
	$< $@ $(REMOTE_RESOURCE)

tmp/%.txta%: $(SECTIONS)
	find tmp -name *.txta

notes/%:
	sh todo.sh $@

.PHONY:

clean: .PHONY
	@echo "\ncleaning up...\n"
	@rm -rf $(SECTIONS)

test:
	bats test/$(DOMAIN)/*.bats
