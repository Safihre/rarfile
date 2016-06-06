
prefix = /usr/local

all:
	python setup.py build

install:
	python setup.py install --prefix=$(prefix)

tgz: clean
	python setup.py sdist

clean:
	rm -rf __pycache__ build dist
	rm -f *.pyc MANIFEST *.orig *.rej *.html *.class
	rm -rf doc/_build doc/_static doc/_templates
	make -C test clean

html:
	rst2html README.rst > README.html
	make -C doc html

lint:
	pylint -E rarfile.py

rbuild:
	curl -X POST https://readthedocs.org/build/6715

upload:
	python setup.py sdist upload

