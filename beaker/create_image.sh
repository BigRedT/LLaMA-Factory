BEAKER_IMAGE="llama-factory-$(date +"%Y%m%d-%Hh%Mm%Ss")"

docker build -f ./docker/docker-cuda/Dockerfile \
    --build-arg INSTALL_BNB=false \
    --build-arg INSTALL_VLLM=true \
    --build-arg INSTALL_DEEPSPEED=false \
    --build-arg INSTALL_FLASHATTN=false \
    --build-arg PIP_INDEX=https://pypi.org/simple \
    -t $BEAKER_IMAGE:latest .

beaker image create --name $BEAKER_IMAGE $BEAKER_IMAGE:latest  --workspace ai2/llama-factory