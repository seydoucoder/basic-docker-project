FROM python:3.9-slim
WORKDIR /app
COPY server.py /app/
CMD ["python", "server.py"]
EXPOSE 8000