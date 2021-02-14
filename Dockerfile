FROM nginx
COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/start.sh /start.sh
COPY source.tar.gz /source.tar.gz

RUN "chmod +x start.sh"
RUN "apt-get update"
RUN "apt-get install -y tar"
RUN "/var/www/html/obs.ninja"
RUN "tar -xvzf /source.tar.gz -C /var/www/html/obs.ninja"
RUN "rm /source.tar.gz"

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["/start.sh"]

# Expose ports.
EXPOSE 80
