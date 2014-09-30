#!/bin/bash

# 
# Deploy server for MEAN 
#


export NAME_APP=$1
echo export  NAME_APP=$($NAME_APP) >> ~/.bashrc


# add key mongo-org
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 
# add to source list 
echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list 
 # update packages
apt-get update
apt-get install -y mongodb git   #install mongo

#service start mongodb

service mongodb start

#install NVM 
curl https://raw.githubusercontent.com/creationix/nvm/v0.11.1/install.sh | bash

#refresh enviroment
source ~/.profile && source ~/.bash_profile

# install node

nvm install v0.11.14
nvm alias $NAME_APP v0.11.14
nvm use $NAME_APP


#install npms

npm install pm2 grunt-cli grunt  -g --unsafe-perm

mkdir /opt/$NAME_APP.git 
cd /opt/$NAME_APP.git

# init empty server repository

git init --bare 

cd hooks/

curl -sL https://raw.githubusercontent.com/Olinguito/Deploy/master/hooks/post-receive > post-receive
chmod +x post-receive



echo " ██████╗ ██╗     ██╗███╗   ██╗ ██████╗ ██╗   ██╗██╗████████╗ ██████╗ ";
echo "██╔═══██╗██║     ██║████╗  ██║██╔════╝ ██║   ██║██║╚══██╔══╝██╔═══██╗";
echo "██║   ██║██║     ██║██╔██╗ ██║██║  ███╗██║   ██║██║   ██║   ██║   ██║";
echo "██║   ██║██║     ██║██║╚██╗██║██║   ██║██║   ██║██║   ██║   ██║   ██║";
echo "╚██████╔╝███████╗██║██║ ╚████║╚██████╔╝╚██████╔╝██║   ██║   ╚██████╔╝";
echo " ╚═════╝ ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═╝   ╚═╝    ╚═════╝ ";
echo "                                                                     ";

