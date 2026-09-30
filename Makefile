.PHONY: dev build check clean

# Separate from public/, which a running dev server rewrites with its live-reload script.
CHECK_DIR := .check

dev:
	hugo server --disableFastRender

build:
	hugo --gc --minify --cleanDestinationDir

check:
	rm -rf $(CHECK_DIR)
	hugo --gc --minify --panicOnWarning --printPathWarnings --printI18nWarnings --destination $(CHECK_DIR)
	./scripts/check_links.sh $(CHECK_DIR)
	./scripts/check_theme.sh $(CHECK_DIR)
	./scripts/check_slides.sh $(CHECK_DIR)

clean:
	rm -rf public resources $(CHECK_DIR)
