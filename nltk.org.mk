DOMAIN = nltk.org
COURSE_SECTIONS = tmp/ch00.txt \
									tmp/ch01.txt \
									tmp/ch02.txt \
									tmp/ch03.txt \
									tmp/ch04.txt \
									tmp/ch05.txt \
									tmp/ch06.txt \
									tmp/ch07.txt \
									tmp/ch08.txt \
									tmp/ch09.txt \
									tmp/ch10.txt \
									tmp/ch11.txt

tmp/%.txt:
	@lynx -dump -list_inline https://www.${DOMAIN}/book/$*.html > $@
	@sh ${DOMAIN}/exercises.sh $@ $*

clean:
	@rm -rf nltk_ch*
