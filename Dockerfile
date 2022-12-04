FROM node:alpine as build
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm start build

FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html
