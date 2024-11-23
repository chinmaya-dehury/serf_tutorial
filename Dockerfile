FROM python:3.9-slim

# Install dependencies
RUN apt-get update && apt-get install -y wget unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set up the working directory
WORKDIR /app

# Copy the Flask app
COPY app.py /app

# Install Flask
RUN pip install flask

# Download and install Serf
RUN wget https://releases.hashicorp.com/serf/0.8.2/serf_0.8.2_linux_amd64.zip && \
    unzip serf_0.8.2_linux_amd64.zip && \
    mv serf /usr/local/bin/ && \
    rm serf_0.8.2_linux_amd64.zip

# Expose the port
EXPOSE 5000

# Start the Flask app
CMD ["python", "app.py"]
