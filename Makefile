default: todo

todo: $(SECTIONS)

{tmp,notes}:
	@mkdir -p $@

tmp/%.txt: tmp/$(COURSE)
	@$(DOMAIN)/model $< $* > $@

tmp/$(COURSE): $(LOCAL_RESOURCE)
	@unzip -o $< -d $@

$(DOMAIN)/get:
	@$@

$(LOCAL_RESOURCE): $(DOMAIN)/get
	@ls $@

clean:
	@rm -rf $(SECTIONS)

test: clean
	bats test/$$DOMAIN/*.bats
