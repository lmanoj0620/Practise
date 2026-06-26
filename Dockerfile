From nginx:latest
WORKDIR /app
RUN apt update && \
    apt install -y
COPY . /var/www/html/inde.html
EXPOSE 80
CMD ["nginx", "-g", "deamon-off;"]

