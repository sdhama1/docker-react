# to build the image
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# to use the build image in production environment
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html