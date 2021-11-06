FROM python:3.8

RUN apt-get update && apt-get install -y
RUN python -m venv venv
RUN venv/bin/pip install --upgrade pip

COPY requirements/production.txt /tmp/requirements/production.txt
RUN venv/bin/pip install --no-cache -r  /tmp/requirements/production.txt

COPY dist /tmp/dist
RUN venv/bin/pip install /tmp/dist/*

COPY run_service.py run_servicer.py

EXPOSE 8085

CMD ["python", "run_servicer.py", "--port", "8085"]
