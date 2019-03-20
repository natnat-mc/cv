.PHONY: all clean

#BEGIN external commands

# usual tools
CP = cp -a
RM = rm -rf
MV = mv -f
MKDIR = mkdir -p

# external tools
LESSC = ./node_modules/.bin/lessc
CONVERT = convert

# custom tools
EJS = ./tools/ejs

#END external commands

#BEGIN object list

IMAGES_SMALL = avatar linkedin github gitlab
IMAGES_LARGE = bg
VIEWS = index
STYLES = main
SCRIPTS = main

#END object list

#BEGIN dynamic object list

VIEWS_RENDERED = $(foreach view, $(VIEWS), out/$(view).html)
IMAGES_64x = $(foreach image, $(IMAGES_SMALL), out/res/64x/$(image).png)
IMAGES_128x = $(foreach image, $(IMAGES_SMALL), out/res/128x/$(image).png)
IMAGES_1920x = $(foreach image, $(IMAGES_LARGE), out/res/1920x/$(image).jpg)
STYLES_RENDERED = $(foreach style, $(STYLES), out/res/$(style).css)
SCRIPTS_COPIED = $(foreach script, $(SCRIPTS), out/res/$(script).js)

LESS_FILES = $(wildcard less/*)
VIEW_FILES = $(wildcard views/*)

#END dynamic object list

#BEGIN main rules
all: views images styles scripts

clean:
	$(RM) out
#END main rules

#BEGIN real rules

# directory creation
out:
	$(MKDIR) $@
out/res: out
	$(MKDIR) $@
out/res/64x: out/res
	$(MKDIR) $@
out/res/128x: out/res
	$(MKDIR) $@
out/res/1920x: out/res
	$(MKDIR) $@

# view rendering
views: out $(VIEWS_RENDERED)
out/%.html: views/%.ejs content/%.json $(VIEW_FILES)
	$(EJS) $< $(patsubst out/%.html, content/%.json, $@) $@

# image resizing
images: out/res/64x out/res/128x out/res/1920x $(IMAGES_64x) $(IMAGES_128x) $(IMAGES_1920x)
out/res/64x/%.png: assets/%.png
	$(CONVERT) $< -resize 64x $@
out/res/128x/%.png: assets/%.png
	$(CONVERT) $< -resize 128x $@
out/res/1920x/%.jpg: assets/%.jpg
	$(CONVERT) $< -resize 1920x $@

# css generation
styles: out/res $(STYLES_RENDERED)
out/res/%.css: less/%.less $(LESS_FILES)
	$(LESSC) $< $@

# js copy
scripts: out/res $(SCRIPTS_COPIED)
out/res/%.js: js/%.js
	$(CP) $< $@
#END real rules
