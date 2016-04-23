## Tuning

The docker image can be tuned using environment variables.

### MAX_CACHE_OBJECT

Squid has a maximum object cache size. Often when caching debian packages vs
standard web content it is valuable to increase this size. Use the
`-e MAX_CACHE_OBJECT=1024` to set the max object size (in MB)


### DISK_CACHE_SIZE

The squid disk cache size can be tuned. use
`-e DISK_CACHE_SIZE=5000` to set the disk cache size (in MB)

### SQUID_DIRECTIVES_ONLY

The contents of squid.conf will only be what's defined in SQUID_DIRECTIVES
giving the user full control of squid.

### SQUID_DIRECTIVES
This will append any contents of the environment variable to squid.conf.
It is expected that you will use multi-line block quote for the contents.

### Persistent Cache

Being docker when the instance exits the cached content immediately goes away
when the instance stops. To avoid this you can use a mounted volume. The cache
location is `/var/cache/squid3` so if you mount that as a volume you can get
persistent caching. Use `-v /home/user/persistent_squid_cache:/var/cache/squid3`
in your command line to enable persistent caching.

## Notes

Ideas for improvement:

- easy chaining to an upstream proxy
