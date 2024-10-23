# Use an official base image (modify as needed)
FROM alpine:latest

# Install required packages
RUN apk add --no-cache bash docker

# Create a non-root user and group
RUN addgroup -S benchuser && adduser -S benchuser -G benchuser

# Set the working directory
WORKDIR /app

# Copy the docker-bench-security.sh script into the image
COPY scripts/docker-bench-security.sh .
# Copy the functions directory into the image
COPY scripts/functions ./functions

# Give execute permission to the script
RUN chmod +x docker-bench-security.sh

# Switch to the non-root user
USER benchuser

# Command to run the script
CMD ["./docker-bench-security.sh"]

