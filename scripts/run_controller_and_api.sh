#!/bin/bash
export FASTCHAT_WORKER_API_TIMEOUT=300
screen -S controller -dm python3 -m fastchat.serve.controller --host 0.0.0.0 --port 31001
screen -S openai -dm python3 -m fastchat.serve.openai_api_server --host 0.0.0.0 --port 8000 --controller-address http://localhost:31001
