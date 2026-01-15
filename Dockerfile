
FROM alpine:latest

# Встановлюємо Python3 та pip
RUN apk add --no-cache python3 py3-pip

# Робоча директорія
WORKDIR /app

# Копіюємо залежності
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо код програми
COPY . .

# Команда запуску
CMD ["python3", "fibonachi.py"]
