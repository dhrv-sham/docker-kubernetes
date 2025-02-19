##### Colima 
```javascript
colima start
colima stop 
```

##### Docker Auth 
```javascript
docker login 
docker logout
docker login -u $username
```

##### Help 
```javascript
docker run --help
docker --help
docker ps --help
docker ps [options]
```

##### Docker version check 
```javascript
docker --version
docker -v
```

##### Interactive session :  
```javascript
// interactive mode plus terminal mode 
docker run -it $image_id
```

##### Docker build image : attached mode
```javascript
docker build -t python-idmb .
docker build .
```


##### Running docker image with tag and container name
```javascript
docker run  - d -p 3000:80 --rm --name $container-name imge-name:tag 
```

##### Restart docker container : detached mode  
```javascript
docker start $name
docker start -a -i $container_name
```

##### Run docker container :  build container 
```javascript
docker run python-idmb
docker run $id
```

##### Build an docker pre-built image through docker hub 
```javascript
docker run node
```

##### Build a interactive command shell through image 
```javascript
docker run -it node
```

##### Stop container : 
```javascript
docker stop $name
```

##### To check all containers : 
```javascript
docker ps -a (all container)
docker ps (check running container)
```

##### To remove the container you need to stop first of all a container 
```javascript
docker stop $name
docker rm $name
```

##### To expose the local host and to connect with internal docekr host 
```javascript
docker run -p 3000:80  $image_id
```

##### To make the cotnainer in detached mode 
```javascript
docker run -p 3000:80 -d $image_id 
```

##### To add attached mode  the docker
```javascript
docker attach $conatiner_id
```

##### Logs of the container : 
```javascript
docker logs $container_id  [detached mode]
docker logs -f $container_id [attached mode]  
```

##### Docker images all
```javascript
docker images
```

##### Remove docker images all ways remember to delete the docker container of that image should be deleted no matter running 
```javascript
docker rmi [$id] 
docker image prune (remove all the docker images )
```

##### Docker delete container auto when execution got over 
```javascript
docker run -p 3000:80 --rm -d $image_id
```

##### Docker inspect image :
```javascript
docker image inspect $id
```

##### Copy into container : 
```javascript
docker cp dummy/. nice_hermann/test
docker cp folder_name/. $name_conainer:/container_path 
```

#####  Copy from container :
```javascript
docker cp  nice_hermann:/test/. dummy
```

##### Rename and tagging container : 
```javascript
docker run -p 4000:50  -d --name  $name $id
```

##### Rename and tagging image : 
```javascript
// this v1 is usually used in docker file FROM server-side:v1s
docker build -t server-side:v1 .
```


##### To rename and retag an existing image:
```javascript
docker tag server-side:v1 dhrvsharma/server-side-hello-node:v2
```

##### Sharing images and containers :
```javascript
// Everyone who has images can run containers
// Either share docker file or image to run 
//  docker hub and private registry 
docker tag 9d4d34967b05 dhrvsharma/kub-first-app:v1
docker push dhrvsharma/kub-first-app:v1
docker pull $name
```

##### Docker using the named volumes : 
```javascript
//  The -v feedback:/app/feedback option is used to create a named volume called feedback and mount it to the /app/feedback directory inside the container. 
docker run -p 3000:80 -d --name  $name -v :$dir $image-name:tag
// docker run -p 3000:80 -d --name  feedback-app -v feedback:/app/feedback feedback-node:vol  
```

##### Remove All Docker volumes
```js
// list all volumes
docker volume ls
// remove all unused volumes
docker volume rm $(docker volume ls -qf dangling=true)
```


#####  Bind mounts auto updates the container when changes are done in the hard code : 
```javascript
//  binding our current directory into the /app 
docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback -v "/Users/dhruv/Desktop/docker/data-volumes-01-starting-setup/":/app feedback-node:vol
//  this will works as /app is overwritten by host local files trhough volumes that we create an anonymous volume   
//  backend changes are relfected by nodemon in container  
docker run -d -p 3000:80 --name feedback-app -v feedback:/app/feedback -v "/Users/dhruv/Desktop/docker/data-volumes-01-starting-setup":/app -v /app/node_modules feedback-node:vol 
//  short cut for the path  macOS / Linux:
-v $(pwd):/app
```

##### Docker volumes  
### Anonymous volumes : 
```javascript 
docker run -v/app/data used to save from the overwritten data
```
##### Named volumes :
```javascript 
docker run -v data:/app/data
```
##### Bind mount : 
```javascript
docker run -v /path/to/code:/app/code
```

##### Communication and network
* Container to WWW communication through https request .
* Container to Container Communication 
* Container to Host Machine 


##### Cross Communication in container 
```javascript
// to communicate with container and  add mongo container  and then run through ip address
// docker run -d --name mongodb -p 27017:27017 mongo
docker run -d --rm --network fav-network --name mongo_db mongo 
docker container inspect $id
docker run -p 3000:3000 -d  --rm --name mongo_db network:vol2

// method 2 put all container in a network
// both container should lie in the network 
// created network use direct cotnainer name where you want to communicate container
docker network create fav-network
docker run -d --rm --network fav-network --name mongo_db mongo 
docker run -p 3000:3000 -d --rm --network fav-network --name server_module fav:vols2
docker network ls
```



## Docker Multiple Container 
##### Local Host Mannual Connection
* Node js and React Application is created
* Setting Up a Project with Database -> Backend -> FrontEnd
* Database must persist and access should be limited
* Live source Code Updates
* Connect with Local Host Machine
* Frontend [3000] <-> Backend [80] <-> mongoDb [27017]
```js
// Connection With The Local host Machine
// First With The Database 
// expose the mongo container to a port 27017
docker run --name $name --rm -d -p 27017:27017  mongo
// created a backend container 
// Need to build a docker file 
docker build -t $img_name:v .
// connection through local host 
// 'mongodb://host.docker.internal:27017/course-goals', -> make connection 
docker run --name cont_name --rm $img_name:v
// port expose of backend for frontennd to 80
docker run --name goals-backend --rm -d -p 80:80 go
al_node:v2
// created a frontend container
// created a frontend Docker React File
docker build -t $img_name:v .
// expose front end port 3000
docker run --name $cont_name --rm -d -p 3000:30
00 img_name:v
```

##### Creating a Network for application
```js
// list all network
docker network ls
// create new network
docker network create $net-name
// add mongo container to network
docker run --name mongodb --rm -d --network $net-name mongo
// add backend container to network
// add the name of the mongodb image
// 'mongodb://mongodb:27017/course-goals' -> mongodb is the name of container
docker build -t  goal_node:v3 .
docker run --name 
docker run --name goals-backend --rm -d --network $net-name goal_node:v3
// frontend container
// 'http://goals-backend/goals/' -> replace the local host with back-end conainer name
docker run -d --rm -p 3000:3000 --name goal_fronte
nd --network $net-name goal_react:v2
```

##### React Issue
```js
// react is browser side rendereing so it cant use container name 
// so we need to expose or frontend container ports and backend container ports
// we dont need to expose mongo ports as it is interacted with the backend only 
// add only backend and mongo to network
docker build -t goal_react:v3 .
docker run -d --rm -p 80:80 --name goal-backend --network goals-net goal_node:v3
docker run -d --rm -p 3000:3000 --name goal-frontend  goal_react:v3
```

##### Data Persistency with Mongo Db even after container deleted data remains
```js
// -v own_directory:/data/db
docker run -d --name mongodb -v  data:/data/db --rm -d --network goals-net mongo

//named volume
docker run -d --rm -p 80:80 --name goal-backend -v logs:/app/logs --network goals-net goal_node:v3
// longer path overwrites the shorter path 
// for auto update container we used bind mount the first version then for logs we used named volumes and then for not overwritting we use naonymours volume
docker run -d --rm -p 80:80 -v /Users/dhruv/Desktop/docker/multi-01-starting-setup/backend:/app -v logs:/app/logs  -v /app/node_modules   --name goal-backend --network full-network goal_node:v3
docker run  --rm -d -v /Users/dhruv/Desktop/docker/multi-01-starting-setup/frontend/src/:/app/src -p 3000:3000  --name goals-frontend goal-react:vr
```




### Docker Compose
* Automating Multi-Container setups
* One Configuration File Required 
* Services refers to containers only
* Always create .yaml or .yml file
* Terminal should be accessed through same directory
```js
// start the compose file 
// add container
docker-compose up
docker-compose up -d // start with the de-attached mode
docker-compose down // remove container only
docker-compose down -v // remove the volume and container

docker-compose up -help
docker-compose build // force build images not run

```


## Kubernetes
##### Installatation tools minikube virtualbox and kubectel
```javascript
brew install minikube
// start with the cluster
minikube start
minikube status
// to get the display of the cluster 
minikube dashboard
```




#### Kubernetes deals with the object 
Multiple objects are there like pod deployments services and volkume 
#### Pod Object 
* Smallest unit kubernetes interacts with 
* Run multiple containers on the same pod
* Pods contain shared resources like volumes for all pod cotnainers 
* Pods had a cluster internal ip address by default 
* Pods are ephemeral menas if pods deleted or replaced the data will be lost 
* Kubernetes manage the pods 
#### Deployment Object 
* Controls multiple pods you set a desrireed state , kubernetes then changes the actal state hence deployments can be paused deleted and rolled back , deployments can be scaled up , deployments manage the pods for you and you can create multiple deployments , you never directly interact with the pods instead deployment do it for you
#### Service Object 
* Exposes pods to the cluster or externally 
* Pods have an internal ip which can be changed when pods are replaced 
* Service group pods with a shared ip
* Services can allow external access to pods 
* services are used to reach pods external cluster


## Kubernetes commands 
###### Kubectl deployments command
```javascript
kubectl help
// create new deployments
// kubectl create deployment $depl_name --image=imagd _name_of_the_container
kubectl create deployment first-app --image=dhrvsharma/kub-first-app:v1
// deployment ready / number of deployment
kubectl get deployments
// current/target
kubectl get pods
// deployment will never going to work as container is stored as in other local environment and kubectl is accessing through virtual machine 
kubectl delete pods $name
kubectl delete deployments $name
```

##### kubectl service commands

```javascript
// two type of ports are there cluster ip and node port 
kubectl create service $type $name --tcp=port:$exposePort
// expose ports 
kubectl expose deployment sixth-app --type=ClusterIp  --port=8080
kubectl expose deployment sixth-app --type=NodePort  --port=8080
kubectl expose deployment sixth-app --type=LoadBalancer  --port=8080
// get services
kubectl get services
// exposing to the local machine 
minikube service $name
```

##### kubectl scale commands
```js
// if you scale down pods will automatically get terminated 
kubectl scale deployments/$name_of_pod --replicas=$number
```

##### Rebuild deployments
```js
// version tags are comoulsory to give 
docker build -t dhrvsharma/kub-first-app:v2 .
docker push dhrvsharma/kub-first-app:v2
// kubectl set image deployment/sixth-app kub-first-app=dhrvsharma/kub-first-app
kubectl set image deployment/$name_depl $container_name=$image_name:tag

```

##### Rollout deployments
```js
kubectl rollout status deployment/$name
kubectl rollout undo deploment/$name
// returns multiple revision 
kubectl rollout history deployment/$name
// tells the history of particular version through revision
kubectl rollout history deployment/$dep_name --revision=$rev_num
// rollback to particular version through revision
kubectl rollout undo deployment/$dep_name --to-revision=$rev_num
```


##### Delete through Kubectl
```js
kubectl delete services  $serv_name
kubectl delete deployments $dep_naem
```


##### Declarative approach of kubernetes
```js

```
