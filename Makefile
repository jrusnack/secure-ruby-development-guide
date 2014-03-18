all: build

.PHONY: all build

build:
	publican build --formats=html,pdf,epub --langs=en-US --config=publican.cfg

build-html:
	publican build --formats=html --langs=en-US --config=publican.cfg

build-pdf:
	publican build --formats=pdf --langs=en-US --config=publican.cfg

build-epub:
	publican build --formats=epub --langs=en-US --config=publican.cfg

clean:
	-rm -rf tmp

upload: clean build
	rsync -avP --delete tmp/en-US/html/. file.brq.redhat.com:public_html/secure-ruby/.
	rsync -avP tmp/en-US/*Secure_Ruby*.epub file.brq.redhat.com:public_html/secure-ruby.epub
	rsync -avP tmp/en-US/pdf/*Secure_Ruby*.pdf file.brq.redhat.com:public_html/secure-ruby.pdf