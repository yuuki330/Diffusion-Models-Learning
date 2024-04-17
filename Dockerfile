FROM python:3.8.6-slim

RUN apt update && apt upgrade -y
RUN apt install -y \
    cmake \
    build-essential \
    git \
    curl \
    zip

ENV TZ=Asia/Tokyo

ARG req_path="workspace/requirements.txt"
COPY ${req_path} /workspace/
RUN python -m pip install --upgrade pip \
    && pip install --no-cache-dir -r ${req_path}