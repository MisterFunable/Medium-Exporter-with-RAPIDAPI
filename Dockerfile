FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY fetch_medium_posts.py .

CMD ["python", "fetch_medium_posts.py"]

