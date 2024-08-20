GPUS=$1

# paths
SRC_CODE_PATH=hostpath:///net/nfs.cirrascale/prior/tanmayg/Code/LLaMA-Factory
SRC_RESULT_PATH=hostpath:///net/nfs/prior/tanmayg/Data/llama-factory

beaker session create \
    --image beaker://tanmayg/llama-factory-20240820-01h47m14s\
    --budget ai2/prior \
    --gpus $GPUS \
    --secret-env HF_TOKEN=HF_TOKEN \
    --shared-memory='200GiB' \
    --mount $SRC_CODE_PATH=/root/LLaMA-Factory \
    --mount $SRC_RESULT_PATH=/root/results \
    --bare \
    --workspace ai2/llama-factory \
    --port 8000