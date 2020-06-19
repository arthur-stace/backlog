OK_SH = ~/dotfiles-local/bin/ok.sh

USER = arthur-stace

TMP_FILES = /tmp/repos.txt

ADD_REMOTE = git remote add

SUBTREE_ADD = git subtree add --squash --prefix

.PHONY:
remotes: /tmp/repos.txt .PHONY
	for name in $(shell cat $< | head -n 2); do \
		qualified_name=$(USER)/$$name; \
		echo $$qualified_name; \
		$(ADD_REMOTE) $$qualified_name https://github.com/$$qualified_name; \
		echo $(SUBTREE_ADD) $$qualified_name "$$qualfied_name"master; \
	done

/tmp/repos.txt:
	$(OK_SH) list_repos $(USER) _filter='.[] | "\(.name)"' > $@

clean:
	for name in $(shell cat /tmp/repos.txt); do git remote rm $(USER)/$$name; done
	rm -rf $(TMP_FILES)
	rm -rf arthur-stace
