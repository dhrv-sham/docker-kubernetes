colima :
--> colima start
--> colima stop 


docker auth : 
--> docker login 
--> docker logout
--> docker login -u $username

help :
-->docker run --help
-->docker --help
-->docker ps --help
-->docker ps [options]

Docker version check : 
-->docker --version
-->docker -v

interactive session :  interactive mode plus terminal mode 
-->docker run -it $image_id

Docker build image : attached mode
-->docker build -t python-idmb .
-->docker build .


running docker image with tag and container name
-> docker run  - d -p 3000:80 --rm --name $container-name imge-name:tag 


restart docker container : detached mode  
-->docker start $name
-->docker start -a -i $container_name

run docker container :  build container 
-->docker run python-idmb
-->docker run $id

build an docker pre-built image through docker hub 
-->dokcer run node


build a interactive command shell through image 
-->docker run -it node

stop container : 
-->docker stop $name

to check all containers : 
-->docker ps -a (all container)
-->docker ps (check running container)

to remove the container you need to stop first of all a container 
--> docker stop $name
--> docker rm $name


to expose the local host and to connect with internal docekr host 
-->docker run -p 3000:80  $image_id

to make the cotnainer in detached mode 
-->docker run -p 3000:80 -d $image_id 

to add attached mode  the docker
-->docker attach $conatiner_id


logs of the container : 
-->docker logs $container_id  [detached mode]
-->docker logs -f $container_id [attached mode]  


docker images all
--> docker images


remove docker images all ways remember to delete the docker container of that image should be deleted no matter running 
--> docker rmi [$id] 
--> docker image prune (remove all the docker images )


docker delete container auto when execution got over 
--> docker run -p 3000:80 --rm -d $image_id


docker inspect image :
--> docker image inspect $id


copy into container : 
--> docker cp dummy/. nice_hermann/test
--> docker cp folder_name/. $name_conainer:/container_path 


copy from container :
--> docker cp  nice_hermann:/test/. dummy


rename and tagging container : 
--> docker run -p 4000:50  -d --name  $name $id

rename and tagging image : 
***this v1 is usually used in docker file FROM server-side:v1s***
--> docker build -t server-side:v1 .



To rename and retag an existing image:
--> docker tag server-side:v1 hrvsharma/server-side-hello-node:v2

sharing images and containers :
***Everyone who has images can run containers***
***Either share docker file or image to run ***
<!-- docker hub and private registry -->
-->docker push dhrvsharma/server-side-hello-node:v2
-->docker pull $name


docker using the named volumes : 
<!-- The -v feedback:/app/feedback option is used to create a named volume called feedback and mount it to the /app/feedback directory inside the container. -->
-> docker run -p 3000:80 -d --name  $name -v :$dir $image-name:tag
<!--docker run -p 3000:80 -d --name  feedback-app -v feedback:/app/feedback feedback-node:vol  -->



bind mounts auto updates the container when changes are done in the hard code : 
<!-- binding our current directory into the /app -->
-> docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback -v "/Users/dhruv/Desktop/docker/data-volumes-01-starting-setup/":/app feedback-node:vol


<!-- this will works as /app is overwritten by host local files trhough volumes that we create an anonymous volume   -->
<!-- backend changes are relfected by nodemon in container  -->
->docker run -d -p 3000:80 --name feedback-app -v feedback:/app/feedback -v "/Users/dhruv/Desktop/docker/data-volumes-01-starting-setup":/app -v /app/node_modules feedback-node:vol 
<!-- short cut for the path -->
macOS / Linux: -v $(pwd):/app


<!-- docker volumes  -->
anonymous volumes : docker run -v/app/data used to save from the overwritten data
named volumes : docker run -v data:/app/data
bind mount : docker run -v /path/to/code:/app/code

