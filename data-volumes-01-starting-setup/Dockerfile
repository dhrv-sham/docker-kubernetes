FROM node:14

WORKDIR /app

# copied package.json to /app
COPY package.json .

RUN npm install

COPY . .


EXPOSE 80


# add volume 
# any data written to /app/feedback inside the container will be stored on the host machine or a Docker volume, ensuring data persistence and enabling data sharing.
# anonymous volume
# VOLUME [ "/app/feedback"  ]

CMD ["node","server.js"]