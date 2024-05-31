FROM ubuntu:24.04

RUN apt-get update && apt-get install -y python3 pip python3-venv python3.12-venv git && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/dani3l0/librusik
WORKDIR /librusik

RUN python3 -m venv librusik-env
RUN . librusik-env/bin/activate && pip install -r requirements.txt && pip install setuptools


CMD ["librusik-env/bin/python", "librusik.py", "--skip-wizard"]
