# fixme : cleanrly environment variables need to be dealt with better
LOCAL_RESOURCE=tmp/$(COURSE).zip
REMOTE_RESOURCE=https://www.$(DOMAIN)/$(COURSE)
default: run

build:
	docker build -t $$DOMAIN:latest .

run:
	docker run -it \
		--env-file $$ENV_FILE \
		-v $(shell pwd):/work \
		$(DOMAIN):latest make sections

sections: $(SECTIONS)

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
	@echo "\ntesting specified files...\n"
	@jq -Msce < $(SECTIONS) | head -c 45
	@echo "\n\n\nfiles contain valid json\n"
