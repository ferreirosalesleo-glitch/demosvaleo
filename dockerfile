FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/* /etc/nginx/conf.d/default.conf

RUN printf 'server {\n\
    listen 80;\n\
    server_name _;\n\
    root /usr/share/nginx/html;\n\
    index index.html;\n\
    location / {\n\
        try_files $uri $uri/ $uri.html =404;\n\
    }\n\
    location ~ /\\. {\n\
        deny all;\n\
    }\n\
}\n' > /etc/nginx/conf.d/default.conf

COPY . /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
