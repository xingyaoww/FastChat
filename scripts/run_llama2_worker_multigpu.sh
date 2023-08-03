#!/bin/bash
# CUDA_VISIBLE_DEVICES=0,2,3 ./scripts/run_llama2_worker_multigpu.sh meta-llama/Llama-2-13b-chat-hf 3 --limit-worker-concurrency 10

SERVER_IDX=2
SERVER_PORT=$((31000 + $SERVER_IDX))
MODEL=$1  # e.g., meta-llama/Llama-2-13b-chat-hf
N_GPUS=$2
EXTRA_ARGS="${@:3}"
echo $MODEL
export FASTCHAT_WORKER_API_TIMEOUT=360
python3 -m fastchat.serve.model_worker \
    --model-path $MODEL \
    --conv-template "llama-2-empty-sys" \
    --host 0.0.0.0 \
    --port $SERVER_PORT \
    --worker http://0.0.0.0:$SERVER_PORT \
    --controller http://localhost:31001 \
    --max-gpu-memory 15GB \
    --num-gpus $N_GPUS \
    $EXTRA_ARGS

    # --load-8bit \
    # --cpu-offloading
    # --load-4bit \
