# Start with the latest 3.x ChefDK
FROM chef/chefdk:3

RUN ["/bin/sh", "-c", "mkdir -p /scripts"]

COPY ["scripts", "/scripts/"]

RUN ["bin/sh", "-c", "chef gem install kitchen-docker -v 2.9.0"]

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

