# syntax=docker/dockerfile:1

FROM python:3.10-slim

WORKDIR /app

COPY . /app

RUN pip --no-cache-dir install -r requirements.txt

# Expose port 5000 to the outside world
EXPOSE 5000

# Define environment variable
ENV FLASK_APP=app.py

# Run app.py when the container launches
CMD ["flask", "run", "--debug", "--host=0.0.0.0", "--port=5000"]