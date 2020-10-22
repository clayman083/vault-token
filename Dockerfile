FROM debian:10-slim

# Install required libraries and Hashicorp Vault
RUN apt-get -qq update > /dev/null && \
    apt-get install -y -qq curl gnupg2 apt-utils lsb-release software-properties-common > /dev/null && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get -qq update && apt-get install -y -qq vault && \
    apt autoremove -y --quiet

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
