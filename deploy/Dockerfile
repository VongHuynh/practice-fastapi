FROM python:3.10-slim

WORKDIR /app

COPY . .

RUN pip install --upgrade pip

RUN pip install -r requirement.txt

EXPOSE 8000

CMD ["python","./src/main.py"]