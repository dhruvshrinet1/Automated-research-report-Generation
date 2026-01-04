# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Install system dependencies (if any are needed for reportlab or others)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy dependencies first to leverage cache
COPY requirements.txt .

# Install Python dependencies
# We remove '-e .' from requirements.txt temporarily for the build, or just allow it if files are there.
# To be safe, we install requirements then the app.
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Install the application package itself
RUN pip install .

# Create directories for artifacts
RUN mkdir -p logs generated_report

# Expose port
EXPOSE 8000

# Run the application
CMD ["uvicorn", "research_analysis.api.main:app", "--host", "0.0.0.0", "--port", "8000"]
