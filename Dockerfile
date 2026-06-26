FROM nginx:latest
WORKDIR /app
RUN apt update && \
    apt install -y
COPY index.html /var/www/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "deamon-off;"]

