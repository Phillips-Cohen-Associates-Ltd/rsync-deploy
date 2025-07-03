FROM ubuntu:24.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
       rsync openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Labels
LABEL "com.github.actions.name"="Deploy with rsync" \
      "maintainer"="Obinna Odirionye <odirionye@mail.com>" \
      "org.opencontainers.image.description"="GitHub Action: deploy via rsync"

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
