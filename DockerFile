# Use an official lightweight Python image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY app.py .

# Command to run the Python script
CMD ["python", "app.py"]
