#multi-step build 

# BUILD step
FROM node:alpine as builder
WORKDIR './app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build 

# RUN step
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
