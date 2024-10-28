# Use a base image that has Docker installed
FROM docker:20.10.7

# Set the working directory inside the container
WORKDIR /app

# Copy the functions and scripts directories into the container
COPY scripts/functions/ /app/functions/
COPY scripts/docker-bench-security.sh /app/scripts/docker-bench-security.sh

# Make the docker-bench-security.sh script executable
RUN chmod +x /app/scripts/docker-bench-security.sh

# Verify that the files have been copied correctly (for debugging)
RUN echo "Listing /app:" && ls -l /app && echo "Listing /app/scripts:" && ls -l /app/scripts

# Set the entrypoint to run the docker-bench-security script
ENTRYPOINT ["/app/scripts/docker-bench-security.sh"]

