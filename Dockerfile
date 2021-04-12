FROM python:3.8-slim

WORKDIR /app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "sql_app.main:app", "--host", "0.0.0.0", "--port", "80"]
