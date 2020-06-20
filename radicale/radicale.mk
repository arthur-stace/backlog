COLLECTION_ROOT = $(APPLICATION)/data/collections/collection-root
WORKDIR = $(shell pwd)


default: extract



extract: $(COLLECTION_ROOT)/user/$(DOMAIN)/.Radicale.props



$(COLLECTION_ROOT):
	mkdir -p $@



$(COLLECTION_ROOT)/user/%/.Radicale.props: $(COLLECTION_ROOT)
	rm -f $@
	mkdir -p `dirname $@`
	jq -nc  --arg name $(DOMAIN) --arg desc $(DOMAIN) --arg color '#000000' -f etc/`basename $@`.jq > $@



