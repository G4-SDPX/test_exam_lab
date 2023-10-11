# FROM python:3.7-alpine
# WORKDIR /app
# ENV FLASK_APP=app.py
# ENV FLASK_RUN_HOST=0.0.0.0
# COPY requirements.txt /app/requirements.txt
# RUN pip install -r /app/requirements.txt
# EXPOSE 5000
# COPY . .
# CMD ["flask", "run"]

FROM python:3.7-alpine

WORKDIR /app

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

COPY requirements.txt /app/requirements.txt

# ตั้งค่าความเหมาะสมให้ Docker ใช้คำสั่ง pip จากโฮสต์
RUN apk --no-cache add curl
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py
RUN pip install -r /app/requirements.txt

EXPOSE 5000

COPY . .

CMD ["flask", "run"]