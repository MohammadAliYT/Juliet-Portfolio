# Step 1: Build the application
FROM node:18-alpine AS build

WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) first to leverage Docker caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the Next.js app
RUN npm run build

# Step 2: Production image
FROM node:18-alpine

WORKDIR /app

# Copy built files from the build stage
COPY --from=build /app /app

# Install only production dependencies (optional)
RUN npm ci --only=production
RUN npm install -g cross-env

# Expose the port the app will run on
EXPOSE 8000

ENV PORT=8000

# Start the Next.js server
CMD ["npm", "start"]
