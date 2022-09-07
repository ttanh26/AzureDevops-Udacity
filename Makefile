setup:
	python3.7 -m venv ~/.udacity-devops

install:
	python3.7 -m pip install --upgrade pip &&\
		python3.7 -m pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb


lint:
	#hadolint Dockerfile #uncomment to explore linting Dockerfiles
	pylint --disable=R,C,W1203 --fail-under=9 app.py

all: install lint test
