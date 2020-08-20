# pull python image
FROM python:3.8.3-alpine

# set working dir
WORKDIR /usr/src/app

# set env variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

# install reqs
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy project
COPY . .

ENTRYPOINT ["./entrypoint.sh"]
