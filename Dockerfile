FROM minio/minio:RELEASE.2022-03-14T18-25-24Z

# Add user/group dokku
RUN groupadd -g 32767 dokku
RUN adduser -u 32767 -g dokku dokku
USER dokku

# Run the server and point to the created directory
CMD ["server", "--address", ":9000", "--console-address", ":5000", "/data"]
