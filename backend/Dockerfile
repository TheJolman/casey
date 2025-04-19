FROM node:20-alpine
WORKDIR /app

# Install deps
COPY package.json package-lock.json ./
RUN npm ci

# Copy source
COPY src ./src

EXPOSE 8000
CMD ["npm", "start"]
