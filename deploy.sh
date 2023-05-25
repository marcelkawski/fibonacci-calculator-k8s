# build images
docker build -t mkawski/fib-calc-client:latest -t mkawski/fib-calc-client:$SHA -f ./client/Dockerfile ./client
docker build -t mkawski/fib-calc-server:latest -t mkawski/fib-calc-server:$SHA -f ./server/Dockerfile ./server
docker build -t mkawski/fib-calc-worker:latest -t mkawski/fib-calc-worker:$SHA -f ./worker/Dockerfile ./worker

# push images to Docker Hub
docker push mkawski/fib-calc-client:latest
docker push mkawski/fib-calc-server:latest
docker push mkawski/fib-calc-worker:latest

docker push mkawski/$SHA
docker push mkawski/$SHA
docker push mkawski/$SHA

# apply configs
kubectl apply -f k8s

# set latest images on each deployment
kubectl set image deployment/client-deployment client=mkawski/fib-calc-client:$SHA
kubectl set image deployment/server-deployment server=mkawski/fib-calc-server:$SHA
kubectl set image deployment/worker-deployment worker=mkawski/fib-calc-worker:$SHA