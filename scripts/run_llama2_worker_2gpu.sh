#!/bin/bash
SERVER_IDX=2
SERVER_PORT=$((31000 + $SERVER_IDX))
export FASTCHAT_WORKER_API_TIMEOUT=360
python3 -m fastchat.serve.model_worker \
    --model-path meta-llama/Llama-2-7b-chat-hf \
    --conv-template "llama-2" \
    --host 0.0.0.0 \
    --port $SERVER_PORT \
    --worker http://0.0.0.0:$SERVER_PORT \
    --controller http://localhost:31001 \
    --limit-worker-concurrency 10 \
    --max-gpu-memory 15GB \
    --num-gpus 2 \
    # --load-8bit \
    # --cpu-offloading
    # --load-4bit \
