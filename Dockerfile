FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build all the stuff for run phase copy we are coping file from builder phase and paste it to /app/build and to run anything in 
#nginx we have to paste the path which is /usr/share/nginx/html we dont have to metion start nginx default start 


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

