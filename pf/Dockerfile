# Imagen base
FROM debian:jessie

# Se instalan depenencias
RUN apt-get -y update && apt-get install -y \
	python2.7 \
	python-setuptools \
	git \
	wget \
	unzip \
	python-pip \
	python-dev \
	gcc \
	gettext \
	--no-install-recommends && \
	apt-get clean

# Se instala PIL 1.1.7
RUN pip install "http://effbot.org/media/downloads/Imaging-1.1.7.tar.gz"

# Se baja Google App Engine para Python
WORKDIR /usr/lib
RUN wget -nv "https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.24.zip" && unzip -q google_appengine_1.9.24.zip && rm google_appengine_1.9.24.zip

# Se agrega Google App Engine al PATH
ENV PATH $PATH:/usr/lib/google_appengine

# Se instala pytest
RUN easy_install-2.7 pytest

# Se baja el Person Finder con git
RUN git clone https://github.com/dxc/people_finder_chile.git /pf

# Se ejecuta el Person Finder
WORKDIR /pf

# Abrir puerto 8001 para Person Finder
EXPOSE 8001

CMD python /usr/lib/google_appengine/dev_appserver.py /pf/app --datastore_path /pf/data.datastore --port 8001 --admin_port 8001 --host 0.0.0.0 --skip_sdk_update_check

