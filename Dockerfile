FROM Python:latest
WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*



COPY . /app
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8051
CMD ["steamlit", "run", "app.py","", "--server.port=8051", "--server.address=0.0.0.0"]
