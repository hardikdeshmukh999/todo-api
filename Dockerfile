# 1. base image — slim alpine = tiny size (~180MB vs ~900MB)
FROM node:18-alpine

# 2. working directory inside the container
WORKDIR /app

# 3. copy package files FIRST (Docker caches this layer)
COPY package*.json ./

# 4. install only production dependencies
RUN npm install --production

# 5. copy the rest of your source code
COPY src/ ./src/

# 6. expose port so Docker knows what to map
EXPOSE 3000

# 7. command to start the app
CMD ["node", "src/app.js"]