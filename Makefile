include $(DOMAIN)/$(DOMAIN).mk
include $(APPLICATION)/$(APPLICATION).mk

.PHONY:

default: extract transform load


transform: .PHONY


load: $(DIST)
	mkdir -p $<
	for file in $(SECTIONS); do cp $$file $</; done
	mv dist backlog/



docs/%.plantuml:
	@plantuml -ttxt $@



clean: .PHONY
	@echo "\ncleaning up...\n"
	@rm -rf dist/$(DOMAIN)/$(COURSE)
	@rm -rf tmp/$(DOMAIN) tmp/*.txt
	@rm -rf $(SECTIONS)



build:
	docker build -t $(APPLICATION):latest -f $(APPLICATION)/Dockerfile $(APPLICATION)

swagger-editor:
	docker run -d -p 80:8080 -v $(pwd):/tmp -e SWAGGER_FILE=/tmp/swagger.json swaggerapi/swagger-editor
