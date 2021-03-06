.PHONY: clean-pyc test tox-test upload-docs

all: clean-pyc test

test:
	py.test

tox-test:
	tox

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +

upload-docs:
	$(MAKE) -C docs html
	python setup.py upload_docs

release:
	python setup.py sdist bdist_wheel upload
