.PHONY: dev build check clean

# Separate from public/, which a running dev server rewrites with its live-reload script.
CHECK_DIR := .check
# The check builds under a path prefix, as GitHub Pages serves the site, so a link that ignores the base URL is reported as broken.
CHECK_PREFIX := metaseed-breakout

dev:
	hugo server --disableFastRender

build:
	hugo --gc --minify --cleanDestinationDir

check:
	rm -rf $(CHECK_DIR)
	hugo --gc --minify --panicOnWarning --printPathWarnings --printI18nWarnings --baseURL /$(CHECK_PREFIX)/ --destination $(CHECK_DIR)/$(CHECK_PREFIX)
	./scripts/check_links.sh $(CHECK_DIR) $(CHECK_PREFIX)
	./scripts/check_theme.sh $(CHECK_DIR)
	./scripts/check_slides.sh $(CHECK_DIR)

clean:
	rm -rf public resources $(CHECK_DIR)
