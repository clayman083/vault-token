FROM debian:10-slim

# Install required libraries
RUN apt-get -qq update > /dev/null && \
    apt-get install -y -qq curl jq > /dev/null && \
    apt autoremove -y --quiet

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
