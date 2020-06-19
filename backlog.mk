# TODO more clean EXTRACT TRANSFORM LOAD
backlog: build
	docker run -it \
		-e DOMAIN=$(DOMAIN) \
		-e COURSE=$(COURSE) \
		-e SECTIONS="$(SECTIONS)" \
		-e LOCAL_RESOURCE=$(LOCAL_RESOURCE) \
		-e REMOTE_RESOURCE=$(REMOTE_RESOURCE) \
		-v $(shell pwd):/work \
		$(DOMAIN):latest make $(SECTIONS)

{tmp,notes}:
	mkdir -p $@

tmp/$(DOMAIN)/$(COURSE): $(LOCAL_RESOURCE)
	mkdir -p $@
	unzip -o $< -d .

$(LOCAL_RESOURCE): $(DOMAIN)/get
	$< $@ $(REMOTE_RESOURCE)

tmp/%.txt: tmp/$(DOMAIN)/$(COURSE)
	$(DOMAIN)/model $* $< > $@

clean: .PHONY
	@echo "\ncleaning up...\n"
	@rm -rf $(SECTIONS)

build:
	docker build -t $(DOMAIN):latest .

