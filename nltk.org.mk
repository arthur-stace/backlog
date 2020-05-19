default: schedule
	# docker run \
	# 	--rm \
	# 	-p 10000:8888 \
	# 	-e JUPYTER_ENABLE_LAB=yes \
	# 	-v "$PWD":/home/jovyan/work \
	# 	jupyter/scipy-notebook

tmp/notes:
	@mkdir -p $@

schedule: tmp/notes
	@curl https://www.nltk.org/book/ch00.html \
	| pup '#tab-course-plans td text{}' \
	| split -l 3
	@mv x* tmp/
	@sh ./schedule.sh > apts
	${MAKE} clean

clean:
	@mv tmp/notes/* ./notes/
	@rm -rf x*
	@rm -rf tmp/*
