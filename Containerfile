FROM ubi8/nodejs-14-minimal:1-23
EXPOSE 8080
COPY . $HOME
CMD node .
