# set up instruction to build own image 
# every instruction is a layer 
# every instruction is cached and re-evaluated and judjed wheather any changes occurs or not 
FROM node

WORKDIR /app

# copied packeaged.json in /app
COPY package.json /app

# installation requirements   
RUN npm install

# all files copied to app folder in container including npm installation
COPY . /app



# docker container isolation are from local machines 
# expose container to host
EXPOSE 80

CMD ["node","server.js"]


