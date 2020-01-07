FROM ubuntu
ENV DEBIAN_FRONTEND="nonintractive"
RUN apt-get update && apt-get install -yq python-pip
RUN  pip install virtualenvwrapper && virtualenv django
COPY . /usr/src/app/
WORKDIR /usr/src/app
RUN pip install -r requirements.txt
WORKDIR /usr/src/app/notejam
ENTRYPOINT python manage.py syncdb --migrate && python manage.py runserver
