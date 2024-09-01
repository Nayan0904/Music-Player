# Use the Python-Node.js image as a parent image
FROM nikolaik/python-nodejs:latest

# Update and install necessary packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the application code into the container
COPY . /app

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Ensure that all files have the right permissions
RUN chmod -R 755 /app

# Run the bot script
CMD ["python", "main.py"]
