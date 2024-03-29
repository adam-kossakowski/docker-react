FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY src ./src
COPY public ./public
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
