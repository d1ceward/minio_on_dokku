FROM minio/minio:RELEASE.2021-10-27T16-29-42Z

# Add user dokku
RUN adduser -D -u 32769 -g dokku dokku
USER dokku

# Run the server and point to the created directory
CMD ["server", "--address", ":5000", "/data"]
