FROM python:3.4-slim

RUN apt-get update && apt-get install -y \
		sqlite3 \
		git \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN pip install --no-cache-dir django==1.7.7

# Se copia desde el directorio de este Dockerfile o se baja el krr desde GitHub
#COPY . /usr/src/app
RUN git clone https://github.com/dxc/kit-respuesta-rapida.git /usr/src/app

# Create database
RUN ["python", "manage.py", "syncdb", "--noinput"]
# Migrate changes in the database
RUN ["python", "manage.py", "migrate"]

# Load initial data to the database
RUN ["python", "manage.py", "loaddata", "category.json"]

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
