ANOLIS = anolis

all: index.html

index.html: index.src.html data Makefile
	$(ANOLIS) --output-encoding=utf-8 --omit-optional-tags --quote-attr-values \
	--w3c-compat --enable=xspecxref --enable=refs --w3c-shortname="web-alarms" \
	--w3c-status=ED --filter=".publish, .now3c" $< $@

publish: index.src.html data Makefile
	$(ANOLIS) --output-encoding=utf-8 --omit-optional-tags --quote-attr-values \
	--w3c-compat --enable=xspecxref --enable=refs --w3c-shortname="web-alarms" \
	--filter=".dontpublish" --pubdate="$(PUBDATE)" --w3c-status=ED \
	$< index.html
