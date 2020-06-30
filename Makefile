CREATE        = $(shell which yq) new -s
MERGE 				= $(shell which yq) merge -i -a
TAG 					= $(shell date +%s)
BUILD_SCRIPT 	= .github/workflows/backlog.yml
JOB_SCRIPT    = create_job.yml


default: $(BUILD_SCRIPT)


$(BUILD_SCRIPT): /tmp/job.yml
	$(MERGE) $@ $<


/tmp/job.yml: $(JOB_SCRIPT)
	$(CREATE) $< "" "" \
	| sed 's/env.TAG/$(TAG)/g' \
	| sed 's/env.DOMAIN/$(DOMAIN)/g' \
	| sed 's/env.PROJECT/$(PROJECT)/g' \
	> $@


.PHONY:
create_job.yml: .PHONY


clean:
	rm -rf $?
