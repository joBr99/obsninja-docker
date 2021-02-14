FROM nginx
COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/start.sh /start.sh

RUN "curl -sOL -o file.tar.gz https://api.github.com/repos/steveseguin/obsninja/tarball/16.2 && tar -xvzf file.tar.gz -C /var/www/html/obs.ninja"

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
