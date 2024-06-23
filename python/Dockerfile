ARG PYTHON_VERSION=3.11
ARG POETRY_VERSION=1.8.3

FROM python:${PYTHON_VERSION}-slim

ARG POETRY_VERSION

WORKDIR /code

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install poetry==${POETRY_VERSION} && \
    poetry config virtualenvs.create false

COPY pyproject.toml poetry.lock ./

RUN poetry install --no-interaction --no-root

COPY . .

RUN poetry install --no-interaction
