OK_SH = ~/dotfiles-local/bin/ok.sh

USER = arthur-stace

TMP_FILES = /tmp/repos.txt

ADD_REMOTE = git remote add

SUBTREE_ADD = git subtree add --squash --prefix

.PHONY:
remotes: /tmp/repos.txt .PHONY
	for remote_name in $(shell cat $< | head -n 2); do \
		project_name=$(USER)/$$remote_name; \
		$(ADD_REMOTE) $(USER)/$$remote_name https://github.com/$$project_name.git; \
		$(SUBTREE_ADD) $$project_name $(USER)/$$remote_name master; \
	done

/tmp/repos.txt:
	$(OK_SH) list_repos $(USER) _filter='.[] | "\(.name)"' > $@

clean:
	for name in $(shell cat /tmp/repos.txt | head -n 2); do git remote rm $(USER)/$$name; done
	rm -rf $(TMP_FILES)
	rm -rf arthur-stace
