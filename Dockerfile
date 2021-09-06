FROM  node:alpine3.14 as build-step
RUN mkdir /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/build  /usr/share/nginx/html
