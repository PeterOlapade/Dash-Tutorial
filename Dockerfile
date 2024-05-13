# Use Python 3.10 slim image as the base image
FROM python:3.10-slim

# Install g++ and clean up in one RUN statement to keep the image size small
RUN apt-get update && \
    apt-get install -y --no-install-recommends g++ && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8050 available to the world outside this container
EXPOSE 8050

CMD ["python", "app.py"]
