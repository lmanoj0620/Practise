FROM nginx:latest
WORKDIR /app
RUN apt update && \
    apt install -y
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

