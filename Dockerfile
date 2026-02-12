FROM node:22.9.0

# Set the working directory in the container
WORKDIR /usr/src/app


COPY package.json pnpm-lock.yaml pnpm-workspaces ./
COPY test.js ./

RUN pwd

RUN corepack enable

# Install dependencies
RUN pnpm install

RUN ls ./node_modules

EXPOSE 5656

LABEL org.opencontainers.image.documentation="https://github.com/joseph-test-organization/joseph-test-repo/blob/main/README.md" \
  org.opencontainers.image.licenses="MIT License" \
  org.opencontainers.image.source="https://github.com/terascope/base-docker-image" \
  org.opencontainers.image.title="joseph-chat" \
  org.opencontainers.image.vendor="joseph-test-organization" \
  io.terascope.image.node_version="$NODE_VERSION"

# Command to run the application
CMD ["pnpm", "start"]

# Use for debugging
# ENTRYPOINT ["sleep", "infinity"]
