FROM registry.redhat.io/ubi8/nodejs-16-minimal:1
EXPOSE 8080
COPY . $HOME
CMD node .
