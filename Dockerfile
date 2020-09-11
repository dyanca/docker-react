FROM node:alpine as builderx
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builderx /app/build /usr/share/nginx/html