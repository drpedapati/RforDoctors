# Use the official Python base image
FROM python:3.10-slim

# Install R and system dependencies
RUN apt-get update && apt-get install -y \
    r-base \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    build-essential \
    libasound2-dev \
    portaudio19-dev \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

RUN PWD

RUN ls -l 

# Copy the requirements.txt file and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install the renv package
RUN R -e "install.packages('renv')"

# Copy the renv.lock file
COPY renv.lock .

# Restore R packages from the renv.lock file
RUN R -e "renv::restore()"

# Set the user to a non-root user
RUN useradd -m vscode
USER vscode