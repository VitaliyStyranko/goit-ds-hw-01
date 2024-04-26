# Use an official Python runtime as the base image
FROM python:3.12.3

# Set the working directory in the container
WORKDIR /app

# Copy the poetry.lock and pyproject.toml files
COPY poetry.lock pyproject.toml /app/

# Install Poetry
RUN pip install poetry

# Install dependencies using Poetry
RUN poetry config virtualenvs.create false && poetry install --only main

COPY . /app

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Run app.py when the container launches
CMD ["python", "personal_assistant.py"]