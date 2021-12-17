FROM registry.redhat.io/ubi8/nodejs-16-minimal:1

EXPOSE 8080
COPY . $HOME

# Update installed software packages
USER root
RUN microdnf update && microdnf clean all
USER 1001

CMD node .
