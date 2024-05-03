FROM python:3.12-bookworm

WORKDIR /workspaces

RUN mkdir -p /workspaces/.cache/huggingface
RUN chmod -R 777 /workspaces/.cache/huggingface
ENV HF_HOME=/workspaces/.cache/huggingface
ENV HF_TOKEN=$HF_TOKEN
ENV WANDB_API_KEY=$WANDB_API_KEY

# install poetry
RUN pip install poetry
COPY pyproject.toml poetry.lock ./
RUN poetry config virtualenvs.create false
RUN poetry install
