# remove the container if exists or running
if [ $(sudo docker container ls -q -a --filter name=db_c) != '' ]; then
      sudo docker container stop db_c
     sudo docker container rm db_c
fi

# remove the image if exists
if [ $(sudo docker image ls -q --filter reference=db_image) != '' ]; then
     sudo docker image rm db_image
fi

# build the image
 sudo docker build -t db_image .

# start the container
sudo docker run -itd -p 3307:3306 --name db_c db_image
