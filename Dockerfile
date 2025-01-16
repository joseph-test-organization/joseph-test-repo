FROM node:22.9.0

# Set the working directory in the container
WORKDIR /usr/src/app


COPY package.json yarn.lock .yarnrc.yml ./
COPY test.js ./
COPY .yarn ./.yarn

RUN ls -a ./.yarn
RUN pwd

# Install dependencies
RUN yarn install

RUN ls ./node_modules

EXPOSE 5656

# Command to run the application
CMD ["yarn", "start"]

# Use for debugging
# ENTRYPOINT ["sleep", "infinity"]
