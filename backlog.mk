DIST = dist/$(DOMAIN)/$(COURSE)
LOCAL_RESOURCE = tmp/$(COURSE).zip


.PHONY:


default: extract


extract:
	docker run -it \
		-e APPLICATION=$(APPLICATION) \
		-e DOMAIN=$(DOMAIN) \
		-e COURSE=$(COURSE) \
		-e SECTIONS="$(SECTIONS)" \
		-e LOCAL_RESOURCE=$(LOCAL_RESOURCE) \
		-e REMOTE_RESOURCE=$(REMOTE_RESOURCE) \
		-v $(shell pwd):/work \
		$(APPLICATION):latest make $(SECTIONS)

{tmp,notes}:
	mkdir -p $@

tmp/$(DOMAIN)/$(COURSE): $(LOCAL_RESOURCE)
	mkdir -p $@
	unzip -o $< -d `basename $(LOCAL_RESOURCE)`

$(LOCAL_RESOURCE): $(DOMAIN)/get
	$< $@ $(REMOTE_RESOURCE)

tmp/%.txt: tmp/$(DOMAIN)/$(COURSE)
	$(DOMAIN)/model $* $< > $@

