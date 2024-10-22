FROM alpine:3.18@sha256:eece025e432126ce23f223450a0326fbebde39cdf496a85d8c016293fc851978

LABEL \
  org.label-schema.name="docker-bench-security" \
  org.label-schema.url="https://dockerbench.com" \
  org.label-schema.vcs-url="https://github.com/docker/docker-bench-security.git"

# Install necessary packages and ensure docker-bench-security.sh is executable
RUN apk add --no-cache iproute2 \
    docker-cli \
    dumb-init \
    jq && \
    chmod +x /usr/local/bin/docker-bench-security.sh

COPY . /usr/local/bin/

# Consider a more meaningful health check if applicable
HEALTHCHECK CMD [ "sh", "-c", "exit 0" ]

WORKDIR /usr/local/bin

ENTRYPOINT [ "/usr/bin/dumb-init", "/bin/sh", "docker-bench-security.sh" ]
CMD [""]

