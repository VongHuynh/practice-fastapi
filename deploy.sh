echo "checkout"

git fetch origin main:main
git fetch origin app2:app2

docker network create nginx-network

git checkout main

echo "Build app 1"
docker stop fastAPIApp1 | true
docker rmi fastAPIApp1 | true
until docker build -t fastAPIApp1 .

do
  echo "Wating build fastAPIApp1"
  sleep 2
done

docker run -d -p 8000:8000 --name fastAPIApp1 --network nginx-network fastAPIApp1

echo "Build app 2"

git checkout app2
docker stop fastAPIApp2 | true
docker rmi fastAPIApp2 | true

git checkout app2

until docker build -t fastAPIApp2 .

do
  echo "Wating build fastAPIApp2"
  sleep 2
done

docker run -d -p 8001:8000 --name fastAPIApp2 --network nginx-network fastAPIApp2

git checkout main

docker-compose up -f nginx.docker-compose.yml -d

echo "Deploy success" 
#
