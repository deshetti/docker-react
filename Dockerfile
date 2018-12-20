# For production build
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# The files are copied to /app/build from the previous steps
# This is to run nginx
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
