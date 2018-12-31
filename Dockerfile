FROM phusion/passenger-full
# Set correct environment variables.
ENV HOME /root
ENV RAILS_ENV development
RUN apt update
RUN apt install -y sudo
RUN apt-get install -y tzdata
RUN sudo apt-get install -y build-essential libcurl4-openssl-dev
# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
# Start Nginx / Passenger
ARG RUBY_VER
COPY rubyenv /root/
RUN bash /root/rubyenv
RUN rm -f /etc/service/nginx/down
# Remove the default site

# Prepare folders
WORKDIR /home/app
# Add startup script to run during container startup
RUN mkdir -p /etc/my_init.d
RUN chmod +x /etc/my_init.d/*.sh
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /var/www/html/
RUN gem install tzinfo-data

