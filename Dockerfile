FROM alpine:3.19

RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN apk add --no-cache chromium chromium-chromedriver unzip curl
RUN apk add --update --no-cache py3-pip
RUN apk add --no-cache xauth unzip

WORKDIR /usr/src/app
COPY app .
RUN curl --output grass.crx 'https://clients2.google.com/service/update2/crx?response=redirect&prodversion=98.0.4758.102&acceptformat=crx3&x=id%3Dilehaonighjijnmpnagapkhpcdbhclfg%26uc&nacl_arch=x86-64'
RUN pip install --no-cache-dir -r ./requirements.txt --break-system-packages

CMD [ "python", "./main.py" ]
