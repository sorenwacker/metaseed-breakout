.PHONY: dev build check clean

dev:
	hugo server --disableFastRender

build:
	hugo --gc --minify

check:
	hugo --gc --minify --panicOnWarning --printPathWarnings --printI18nWarnings
	./scripts/check_links.sh public

clean:
	rm -rf public resources
