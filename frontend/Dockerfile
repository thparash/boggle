#build environment - step1
FROM node:12.8.0-alpine as react-build
WORKDIR /app
COPY package.json ./package.json
RUN npm install --silent
COPY . ./
RUN npm run build

#production environment -step2
FROM nginx:1.17.6-alpine
COPY --from=react-build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g","daemon off;"]
