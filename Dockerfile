# The builder image, used to build the virtual environment
FROM python:3.11-buster as builder

RUN apt-get update && apt-get install -y git wget

RUN pip install poetry==1.4.2

ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

# A directory to have app data 
WORKDIR /app

COPY pyproject.toml poetry.lock ./

RUN poetry install --without dev --no-root && rm -rf $POETRY_CACHE_DIR 
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/debian10/x86_64/cuda-keyring_1.1-1_all.deb -P /tmp

# The runtime image, used to just run the code provided its virtual environment
FROM python:3.11-slim-buster as runtime
COPY --from=builder /tmp/cuda-keyring_1.1-1_all.deb /tmp/cuda-keyring_1.1-1_all.deb
RUN apt-get update && apt-get -y install software-properties-common && \
    dpkg -i /tmp/cuda-keyring_1.1-1_all.deb && add-apt-repository contrib && apt-get update && apt-get -y install cuda && \
    rm -f /tmp/cuda-keyring_1.1-1_all.deb

ENV VIRTUAL_ENV=/app/.venv \
    PATH="/app/.venv/bin:$PATH"

COPY --from=builder ${VIRTUAL_ENV} ${VIRTUAL_ENV}

COPY ./pipelines/app.py /app/app.py

WORKDIR /app

CMD ["streamlit", "run", "app.py", "--server.port", "8051"]