.PHONY:

FILE_PATTERN = nltk_ch* ocw_*

todo: ${COURSE_SECTIONS} .PHONY
	@rm -f $@
	@for file in $(shell ls ${FILE_PATTERN}); \
		do ${MAKE} notes/$$file >> $@; \
		done
	@rm -f ${FILE_PATTERN}

notes:
	@mkdir $@

notes/%: notes
	@sh makefiles/todo.sh $@

clean:
	@rm -rf ocw_* todo
