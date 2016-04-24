#!/bin/sh

set -e

SQUID=$(/usr/bin/which squid)

# Ensure permissions are set correctly on the Squid cache + log dir.

echo "Setting filesystem acls for squid..."
mkdir -p /var/cache/squid3
setfacl -m u:squid:rwX /var/cache/squid3
setfacl -m d:u:squid:rwX /var/cache/squid3

# Prepare the cache using Squid.
echo "Initializing cache..."
"$SQUID" -FNz

# Launch squid
echo "Starting Squid..."
exec "$SQUID" -NYCd 1
