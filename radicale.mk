SERVICE = radicale
COLLECTION_ROOT = data/collections/collection-root
WORKDIR = $(shell pwd)

default: $(COLLECTION_ROOT) build

build: $(SERVICE)
	docker build -t backlog:latest $(WORKDIR)

# FIXME
release: build
	heroku container:release web -a radicale-service

radicale: .PHONY

data: .PHONY
	${MAKE} $(COLLECTION_ROOT)/user/$(DOMAIN)/.Radicale.props; \
 
$(COLLECTION_ROOT):
	mkdir -p $@

$(COLLECTION_ROOT)/user/%/.Radicale.props: $(COLLECTION_ROOT) .PHONY
	rm -f $@
	mkdir -p `dirname $@`
	jq -nc  --arg name $(DOMAIN) --arg desc $(DOMAIN) --arg color '#000000' -f etc/`basename $@`.jq > $@

