FROM python:3.12-bookworm

WORKDIR /workspaces

RUN mkdir -p /workspaces/.cache/huggingface
RUN chmod -R 777 /workspaces/.cache/huggingface
ENV HF_HOME=/workspaces/.cache/huggingface
ENV HF_TOKEN=$HF_TOKEN
ENV WANDB_API_KEY=$WANDB_API_KEY


# env
RUN pip install uv
COPY pyproject.toml uv.lock ./
RUN uv pip install --system .
