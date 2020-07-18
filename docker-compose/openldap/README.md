# OpenLDAP

## Quick Start
Deploy the docker-compose file and log into phpldapadmin server with
the default credentials, username `cn=admin,dc=example,dc=com` and password
`secret` (unless you have changed these default values). Next create
an Organizational Unit, name it `users`. Create a new group, call it `default`.
Now we can start adding users under the `users` group. Do connect to this
server, make sure to use the IP address of this machine and port number. This
example will not use SSL so your ldap host will look something like this `ldap://192.168.50.203:389`.

You can deploy this yaml file with the following command
```
curl -fsSL https://raw.githubusercontent.com/Eggertron/docker/master/docker-compose/openldap/docker-compose.yml | docker-compose -f - up
```

## Raspberry Pi
To enable setup your raspberry pi to use the ldap server for authentication
```
sudo apt-get install -y libpam-ldapd libnss-ldapd
```
During installation you'll need to add the LDAP server search base
```
dc=example,dc=com

```
