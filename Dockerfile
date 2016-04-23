FROM debian:stable
RUN apt-get update && apt-get -qy install --no-install-recommends python squid3 && apt-get autoremove -y && apt-get clean
RUN sed -i -e "s/^#acl localnet/acl localnet/" \
           -e "s/^#http_access allow localnet/http_access allow localnet/" \
           /etc/squid3/squid.conf
RUN mkdir -p /var/cache/squid3
ADD deploy_squid.py /tmp/deploy_squid.py
CMD /tmp/deploy_squid.py
