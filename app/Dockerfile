# syntax=docker/dockerfile:1

FROM python:3.10-slim

WORKDIR /app

COPY . /app

RUN pip --no-cache-dir install -r requirements.txt

# Define environment variable
ENV FLASK_APP=app.py

# Run app.py when the container launches
CMD ["flask", "run", "--debug"]