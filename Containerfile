FROM npm:ubi8

USER 0

RUN mkdir /app
WORKDIR /app
ADD . /app
RUN chown -R ${PLOIGOS_USER_UID}:${PLOIGOS_USER_UID} /app && \
    chmod -R 774 /app && \
    NPM_PKGS="http-server concurrently" && \
    npm install $NPM_PKGS --save-dev && \
    npm install --save-dev

EXPOSE 3000

USER ${PLOIGOS_USER_UID} 

ENTRYPOINT ["npm"]
CMD [""]
