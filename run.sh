docker build -t fbmsgrbot . 
docker stop $(docker ps -a -q --filter="name= fbmsgrbot")
docker rm $(docker ps -a -q --filter="name= fbmsgrbot")
docker run -it -d -p 5000:5000 --name fbmsgrbot fbmsgrbot
