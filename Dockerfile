FROM minio/minio:RELEASE.2018-06-09T03-43-35Z

# Add user dokku
RUN adduser -D -g dokku dokku
USER dokku

# Create data directory for the user, where we will keep the data
RUN mkdir -p /home/dokku/data

# Run the server and point to the created directory
CMD ["server", "/home/dokku/data"]