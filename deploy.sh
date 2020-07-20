docker build -t metafield/multi-client -f ./client/Dockerfile ./client
docker build -t metafield/multi-server -f ./server/Dockerfile ./server
docker build -t metafield/multi-worker -f ./worker/Dockerfile ./worker

docker push metafield/multi-client
docker push metafield/multi-server
docker push metafield/multi-worker

kubectl apply -f k8s
kubectl rollout restart deployment/server-deployment
kubectl rollout restart deployment/client-deployment
kubectl rollout restart deployment/worker-deployment