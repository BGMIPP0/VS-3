# Use a base image that supports systemd, for example, Ubuntu
FROM ubuntu:20.04

# Install necessary packages for VS Code
RUN apt-get update && \
    apt-get install -y systemd && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install VS Code Server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Expose the web-based VS Code port
EXPOSE 1000

# Start VS Code Server
CMD ["code-server", "--bind-addr", "0.0.0.0:1000", "--auth", "none"]
