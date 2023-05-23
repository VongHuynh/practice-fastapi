echo "checkout"

git fetch origin main:main
git fetch origin app2:app2

docker network create nginx-network

git checkout main

echo "Build app 1"
docker stop fastapiapp1 | true
docker rmi fastapp1 | true

until docker build -t fastapiapp1 .

do
  echo "Wating build fastAPIApp1"
  sleep 2
done


echo "Build app 2"

git checkout app2
docker stop fastapiapp2 | true
docker rmi fastapiapp2 | true

git checkout app2

until docker build -t fastapiapp2 .

do
  echo "Wating build fastAPIApp2"
  sleep 2
done

git checkout main

docker-compose -f demo-loadbalance.docker-compose.yml up -d

echo "Deploy success" 
