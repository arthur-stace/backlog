include $(DOMAIN)/$(DOMAIN).mk
include $(APPLICATION)/$(APPLICATION).mk

.PHONY:

default: extract transform load


transform: .PHONY


load: $(DIST)
	mkdir -p $<
	for file in $(SECTIONS); do cp $$file $</; done
	mv dist backlog/



documentation:
	plantuml docs/*.uml
	open docs/*.png



clean: .PHONY
	@echo "\ncleaning up...\n"
	@rm -rf dist/$(DOMAIN)/$(COURSE)
	@rm -rf tmp/$(DOMAIN) tmp/*.txt
	@rm -rf $(SECTIONS)



build:
	docker build -t $(APPLICATION):latest -f $(APPLICATION)/Dockerfile $(APPLICATION)


