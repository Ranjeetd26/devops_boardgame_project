# sudo yum install java-17-amazon-corretto-devel -y
sudo yum install git -y
sudo yum install docker -y
sudo systemctl start docker

if [ -d "boardgame" ]
then
  echo "repo is cloned and exists"
  cd /home/ec2-user/boardgame
  git pull origin master
else
  git clone https://github.com/Abhi1279/devops_boardgame_project.git
fi

cd /home/ec2-user/boardgame
git checkout master
sudo docker build -t $1
