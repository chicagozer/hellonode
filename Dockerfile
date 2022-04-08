# DOCKER-VERSION 1.2.0
FROM public.ecr.aws/bitnami/node:17
#FROM node:17
# Bundle app source
COPY . /app
WORKDIR /app
# Install app dependencies
RUN npm install

EXPOSE 3000
CMD ["npm", "start"]
