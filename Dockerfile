FROM node:18-alpine AS build

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the application and build
COPY . .
RUN npm run build

# Use a simple Node.js server to serve the React app
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy the build output from the previous stage
COPY --from=build /app/build .

# Install serve to serve the React build
RUN npm install -g serve

# Expose port 3000
EXPOSE 3000

# Start the application
CMD ["serve", "-s", "./", "-l", "3000"]
