FROM node:8

COPY ./fias-client/yarn.lock /yarn.lock
COPY ./fias-client/package.json /package.json

ENV NODE_PATH=/node_modules
ENV PATH=$PATH:/node_modules/.bin
RUN yarn

WORKDIR /app
COPY ./fias-client /app
COPY ./run.sh /app

EXPOSE 3000
EXPOSE 35729

ENTRYPOINT ["/bin/bash", "/app/run.sh"]
CMD ["start"]
