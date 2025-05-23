# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /Rest_API

# Copy the current directory contents into the container at /Rest_API
COPY . /Rest_API

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000 to allow access to the app
EXPOSE 5000

# Define environment variable to ensure Flask runs in production mode
ENV FLASK_APP=main.py
ENV FLASK_RUN_HOST=0.0.0.0

# Run the Flask application when the container starts
CMD ["flask", "run"]