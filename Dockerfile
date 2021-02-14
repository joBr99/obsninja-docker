FROM nginx
COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/start.sh /start.sh
COPY files/source.tar.gz
RUN "tar -xvzf files/source.tar.gz -C /var/www/html/obs.ninja"

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
