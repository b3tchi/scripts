#connect to ubuntu virtual machine
ssh -i ~/.ssh/ubuntuVD.pem jan@20.79.18.66

#documentation link
#https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver15&pivots=cs1-bash

#pull docker image
sudo docker pull mcr.microsoft.com/mssql/server:2019-latest

#initiate docker
sudo docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=testpass123" -p 1433:1433 --name sql1 -h sql1 -d mcr.microsoft.com/mssql/server:2019-latest

#list running containers
sudo docker ps -a

#get to bash of the docker
sudo docker exec -it sql1 "bash"

#connecting to
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "testpass123"

#stop docker
sudo docker stop sql1

#close sql
sudo docker rm sql1

#APPENDIX install sqlcmd connect outside docker
#import GPG
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

#get ubuntu repository
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list

#install tools
sudo apt-get update
sudo apt-get install mssql-tools unixodbc-dev

#register bin in bash rc
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc

#connect to docker
sqlcmd -S 0.0.0.0,1433 -U SA -P "testpass123"
