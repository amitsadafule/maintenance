FROM nginx:1.17.6-alpine

COPY default.conf /etc/nginx/conf.d/default.conf
COPY maintenance.html /usr/share/nginx/html/maintenance.html