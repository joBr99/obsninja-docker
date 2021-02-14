FROM nginx
COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/start.sh /start.sh
COPY source.tar.gz /source.tar.gz

RUN /bin/chmod" +x /start.sh
RUN /bin/mkdir /var/www/html/obs.ninja
RUN /bin/tar -xvzf /source.tar.gz -C /var/www/html/obs.ninja
RUN /bin/rm /source.tar.gz

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["/start.sh"]

# Expose ports.
EXPOSE 80
