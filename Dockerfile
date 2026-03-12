FROM python:3.9-slim
ENV PYTHONUNBUFFERED=1
WORKDIR /code
RUN apt-get update && apt-get install -y postgresql-client
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
EXPOSE 8000
CMD ["gunicorn", "your_project_name.wsgi:application", "--bind", "0.0.0.0:8000"]