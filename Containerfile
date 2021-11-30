FROM registry.redhat.io/ubi8/nodejs-16-minimal:1-6.1638351987
EXPOSE 8080
COPY . $HOME
CMD node .
