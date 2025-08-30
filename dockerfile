FROM python:3.11-slim

# Create non-root user/group
RUN groupadd -g 10001 app && useradd -r -u 10001 -g app app

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ ./app/

# Fix ownership and drop privileges
RUN chown -R app:app /app
USER app

EXPOSE 8000
CMD ["python", "app/main.py"]
