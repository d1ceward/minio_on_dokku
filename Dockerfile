FROM minio/minio:RELEASE.2021-10-27T16-29-42Z

# Add user/group dokku
RUN groupadd -g 32767 dokku
RUN adduser -u 32767 -g dokku dokku
USER dokku

# Run the server and point to the created directory
CMD ["server", "--address", ":9000", "--console-address", ":5000", "/data"]
