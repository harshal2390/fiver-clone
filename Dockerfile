# Dockerfile
FROM node:18

WORKDIR /app

COPY server ./server
COPY client ./client

WORKDIR /app/server
RUN npm install

WORKDIR /app/client
RUN npm install && npm run build

# Serve via server
WORKDIR /app/server
CMD ["npm", "start"]
