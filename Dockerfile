# Start with the latest 3.x ChefDK
FROM chef/chefdk:3

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

