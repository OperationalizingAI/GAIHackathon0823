FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt ./
COPY ./app.py /app/app.py
RUN apt-get update && apt-get install -y build-essential cmake software-properties-common
RUN pip3 install -r requirements.txt
CMD export OPENAI_KEY=$(cat /run/secrets/openai_key); streamlit run app.py --server.port 8051

