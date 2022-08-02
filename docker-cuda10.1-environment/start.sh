
IMG=${IMG:-cuda10.1-env:test}

docker run -d --name cuda-env --gpus=all --network host -v $(pwd):/workspace ${IMG}