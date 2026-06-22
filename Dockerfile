FROM python:3.12 as builder
WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*



COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
FROM python:3.12-slim
COPY from=builder /install /usr/local

COPY . /app
EXPOSE 8051


CMD ["streamlit", "run", "app.py","", "--server.port=8051", "--server.address=0.0.0.0"]
