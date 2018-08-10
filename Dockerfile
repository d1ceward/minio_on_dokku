FROM minio/minio:RELEASE.2018-07-31T02-11-47Z

# Add user dokku
RUN adduser -D -u 32769 -g dokku dokku
USER dokku

# Change workdir
WORKDIR /home/dokku

# Run the server and point to the created directory
CMD ["server", "--address", ":5000", "/home/dokku/data"]