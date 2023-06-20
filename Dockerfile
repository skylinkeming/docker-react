FROM node:16-apline as builder
 
WORKDIR '/app'
 
COPY package.json .
 
RUN npm install
 
COPY . .
 
RUN npm run build
 
 
 
FROM nginx
expose 80
COPY --from=builder /app/build /usr/share/nginx/html