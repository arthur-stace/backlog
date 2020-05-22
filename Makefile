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

todo: $(SECTIONS)

{tmp,notes}:
	mkdir -p $@

tmp/%.txt: tmp/$(COURSE)
	$(DOMAIN)/model $< $* > $@

tmp/$(COURSE): $(LOCAL_RESOURCE)
	unzip -o $< -d $@

$(LOCAL_RESOURCE): $(DOMAIN)/fetch

clean:
	@echo "\ncleaning tmp/\n"
	@rm -rf $(SECTIONS)

test: clean
	bats test/$$DOMAIN.bats
