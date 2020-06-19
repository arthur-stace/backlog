etc/github/trekhleb/javascript-algorithms:
	git remote add trekhleb/javascript-algorithms git@github.com:trekhleb/javascript-algorithms.git &
	git subtree add --prefix $@ --squash trekhleb/javascript-algorithms master
