deps:
	pipenv install --dev
	python setup.py develop

run:
	pipenv run todographql/cli.py run

tests: unit functional

unit functional:
	pipenv run nosetests tests/$@

deploy:
	ansible-playbook provisioning/playbook.yml

tutorial:
	cd tutorial && pipenv run make html
	open tutorial/build/html/index.html

.PHONY: tutorial docs tests
