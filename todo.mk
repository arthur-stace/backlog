todo: ${COURSE_SECTIONS}
	@for file in $(shell ls ocw_*); \
		do ${MAKE} notes/$$file >> $@; \
		done
	rm -f ocw*

notes:
	@mkdir $@

notes/%: notes
	@sh makefiles/ocw.mit.edu/todo.sh $@

clean:
	@rm -rf ocw_* todo
