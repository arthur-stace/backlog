LOCAL_RESOURCE = tmp/$(COURSE).zip

DOMAIN ?= github.com

include $(DOMAIN).mk
include backlog.mk
include radicale.mk

default: $(DOMAIN)
	echo done

$(DOMAIN): backlog data

clean:
	rm -rf tmp/$(DOMAIN) tmp/*.txt
