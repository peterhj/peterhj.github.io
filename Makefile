TEMPLATES := _templates/top.htm _templates/bot.htm
DRAFTS := $(wildcard _drafts/*.htm)
NOTES := $(patsubst _drafts/%.htm,notes/%.html,$(DRAFTS))

.PHONY: all distclean

all: $(NOTES)

notes/%.html: _drafts/%.htm $(TEMPLATES)
	cat _templates/top.htm > $@
	cat $< >> $@
	cat _templates/bot.htm >> $@

distclean:
	rm -f notes/*.html
