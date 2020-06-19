project = ${PROJECT}
labels = "${LABELS}"
CLONE = git clone --depth=1 https://github.com

default: $(project)

$(DOMAIN)/$(project): tmp/$(project)/issues.txt $(DOMAIN)/$(project)/notes
	$(CLONE)/$(project) $@

tmp/$(project)/issues.txt: tmp/$(project)
	ok.sh list_issues $(project) labels=$(labels) _filter='.[] | "\(.html_url)"' > $@

tmp/$(project):
	mkdir -p $@

clean:
	rm -rf github.com/$(project)
	rm -rf tmp/$(project)/issues.txt

$(DOMAIN)/$(project)/notes: tmp/$(project)/issues.txt
	mkdir -p $@
	for url in `cat $<`; do \
		curl $$url \
		| pup '.js-timeline-item' \
		| lynx -dump -stdin -unique_urls -list_inline > $@/`basename $$url`.txt; \
	done
