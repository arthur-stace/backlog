FILE_PATTERN = nltk_ch* ocw_*

todo: ${COURSE_SECTIONS}
	@rm -f $@
	@for file in $(shell ls ${FILE_PATTERN}); \
		do ${MAKE} -f todo.mk notes/$$file >> $@; \
		done
	@rm -f ${FILE_PATTERN}

notes:
	@mkdir -p $@

notes/%: notes
	@sh todo.sh $@
