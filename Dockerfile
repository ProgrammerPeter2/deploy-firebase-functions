FROM node:20-alpine
RUN npm install -g firebase-tools

# Install python/pip
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 py3-pip
RUN python3 -m venv venv
RUN source venv/bin/activate && pip install firebase-functions


COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["entrypoint.sh"]
