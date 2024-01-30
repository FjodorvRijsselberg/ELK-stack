FROM docker.elastic.co/elasticsearch/elasticsearch:8.7.1

# Create a directory for scripts
RUN mkdir -p /usr/share/elasticsearch/scripts

# Copy the setup.sh script into the container
COPY ./setup.sh /usr/share/elasticsearch/scripts/setup.sh

# Switch to the root user temporarily to set up the script
USER root

# Set the correct permissions for the script
RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/scripts && \
    chmod +x /usr/share/elasticsearch/scripts/setup.sh

# Switch back to the elasticsearch user
USER elasticsearch