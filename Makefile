# fixme : cleanrly environment variables need to be dealt with better
LOCAL_RESOURCE=tmp/$(COURSE).zip
REMOTE_RESOURCE=https://www.$(DOMAIN)/$(COURSE)
default: run

build:
	docker build -t $$DOMAIN:latest .

run: build
	docker run -it \
		--env-file test/$(DOMAIN)/test001.env \
		-v $(shell pwd):/work \
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

test: clean run
	jq -Msce < $(SECTIONS)
