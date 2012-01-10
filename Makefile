DISCODEX_VERSION = 0.2
DISCODEX_RELEASE = 0.2

prefix     = /usr/local

PYTHON     = python
PYTHONENVS = DISCODEX_VERSION=$(DISCODEX_VERSION) DISCODEX_RELEASE=$(DISCODEX_RELEASE)
SPHINXOPTS = "-D version=$(DISCODEX_VERSION) -D release=$(DISCODEX_RELEASE)"

.PHONY: build clean install doc doc-clean

build:
	$(PYTHONENVS) $(PYTHON) setup.py build

clean:
	rm -rf build

install:
	$(PYTHONENVS) $(PYTHON) setup.py install --root=$(DESTDIR)/ --prefix=$(prefix)

doc:
	(cd doc && $(MAKE) SPHINXOPTS=$(SPHINXOPTS) html)

doc-clean:
	(cd doc && $(MAKE) SPHINXOPTS=$(SPHINXOPTS) clean)

doc-test:
	(cd doc && $(MAKE) SPHINXOPTS=$(SPHINXOPTS) doctest)