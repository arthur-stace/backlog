include $(DOMAIN).mk

LOCAL_RESOURCE = tmp/$(COURSE).zip

default: run

build:
	docker build -t $$DOMAIN:latest .

run:
	docker run -it \
		-e DOMAIN=$(DOMAIN) \
		-e COURSE=$(COURSE) \
		-e SECTIONS="$(SECTIONS)" \
		-e LOCAL_RESOURCE=$(LOCAL_RESOURCE) \
		-e REMOTE_RESOURCE=$(REMOTE_RESOURCE) \
		-v $(shell pwd):/work \
		$(DOMAIN):latest make sections

sections: $(SECTIONS)

{tmp,notes}:
	mkdir -p $@

tmp/$(COURSE): $(LOCAL_RESOURCE)
	unzip -o $< -d $@

$(LOCAL_RESOURCE): $(DOMAIN)/get
	$< $@ $(REMOTE_RESOURCE)

tmp/%.txt: tmp/$(COURSE)
	$(DOMAIN)/model $* $< > $@


.PHONY:

clean: .PHONY
	@echo "\ncleaning up...\n"
	@rm -rf $(SECTIONS)
