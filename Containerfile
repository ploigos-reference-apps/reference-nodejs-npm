FROM npm:ubi8

USER 0

RUN mkdir /app
RUN chown -R ${PLOIGOS_USER_UID}:${PLOIGOS_USER_UID} /app && chmod -R 774 /app
EXPOSE 3000

USER ${PLOIGOS_USER_UID} 
ADD . /app
WORKDIR /app

ENTRYPOINT ["npm"]
CMD [""]
