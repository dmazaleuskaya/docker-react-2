#multi-step build 

# BUILD phase, it's tagged with a name (name can be basically any)
FROM node:alpine as builder
WORKDIR './app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build 

# RUN phase
FROM nginx

# mostly for the elasticbeanstalk 
EXPOSE 80
# specify the phase from which to copy
COPY --from=builder /app/build /usr/share/nginx/html
