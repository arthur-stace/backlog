MERGE 				= $(shell which yq) merge -i -a
TAG 					= $(shell date +%s)
BUILD_SCRIPT 	= .github/workflows/build.yml


default: $(BUILD_SCRIPT)


$(BUILD_SCRIPT): /tmp/job.yml
	$(MERGE) $@ $<


/tmp/job.yml: create_job.yml


.PHONY:
create_job.yml: .PHONY


