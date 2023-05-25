# build images
docker build -t marcelkawski/fib-calc-client:latest -t marcelkawski/fib-calc-client:$SHA -f ./client/Dockerfile ./client
docker build -t marcelkawski/fib-calc-server:latest -t marcelkawski/fib-calc-server:$SHA -f ./server/Dockerfile ./server
docker build -t marcelkawski/fib-calc-worker:latest -t marcelkawski/fib-calc-worker:$SHA -f ./worker/Dockerfile ./worker

# push images to Docker Hub
docker push marcelkawski/fib-calc-client:latest
docker push marcelkawski/fib-calc-server:latest
docker push marcelkawski/fib-calc-worker:latest

docker push marcelkawski/$SHA
docker push marcelkawski/$SHA
docker push marcelkawski/$SHA

# apply configs
kubectl apply -f k8s

# set latest images on each deployment
kubectl set image deployment/client-deployment client=marcelkawski/fib-calc-client:$SHA
kubectl set image deployment/server-deployment server=marcelkawski/fib-calc-server:$SHA
kubectl set image deployment/worker-deployment worker=marcelkawski/fib-calc-worker:$SHA