FROM node:20-alpine
RUN npm install -g firebase-tools

# Install python/pip
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN pip3 install firebase-functions

COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["entrypoint.sh"]
