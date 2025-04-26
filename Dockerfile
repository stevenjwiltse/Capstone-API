# Build step
FROM node:22-alpine AS builder

WORKDIR /app

COPY ./ ./

RUN npm install
RUN npm run build

# Serve step
FROM nginx:alpine

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy built frontend files
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port
EXPOSE 80

# Start nginx automatically
CMD ["nginx", "-g", "daemon off;"]
