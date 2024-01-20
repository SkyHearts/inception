#!/bin/sh

#redis-server --protected-mode no

if [ ! -f "/etc/redis/redis.conf.bak" ]; then

sed -i.bak 's|# maxmemory <bytes>|maxmemory 256mb|g' /etc/redis/redis.conf
sed -i 's|bind 127.0.0.1 -::1|# bind 127.0.0.1 -::1|g' /etc/redis/redis.conf
sed -i 's|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g' /etc/redis/redis.conf
#sed -i 's|# requirepass foobared|requirepass jyim123|g' /etc/redis/redis.conf

fi


echo "CONFIG SET requirepass jyim1234" | redis-cli


#redis-cli CONFIG SET requirepass "jyim1234"

#redis-server /etc/redis/redis.conf
#redis-server
redis-server --protected-mode no
#systemctl restart redis