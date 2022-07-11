FROM python:3.9

WORKDIR /pears_nightly_export_reformatting

COPY . .

RUN pip install -r requirements.txt

CMD [ "python", "./pears_nightly_export_reformatting.py" ]