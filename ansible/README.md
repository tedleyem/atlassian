# Atlassian Ansible project

### Docker Source files:
- [atlassian/jira-core](https://hub.docker.com/r/atlassian/jira-core)
- [atlassian/confluence](https://hub.docker.com/r/atlassian/confluence)
- [atlassian/bitbucket-server](https://hub.docker.com/r/atlassian/bitbucket)
- [nginx](https://hub.docker.com/_/nginx)
- [postgres](https://hub.docker.com/_/postgres)


### Deploy

**Clone the project**
```
$ git clone https://github.com/tedleyem/atlassian
```

**Set environment variables**
```
$ export DOMAIN=example.com
 ```

**Run docker compose**
```
$ docker-compose -p atlassian up
```

**Set `DNS` according to the above `DOMAIN` value, on somewhere that you want to connect to host of `docker-compose`**

```
$ vim /etc/hosts
        127.0.0.1 jira.example.com www.jira.example.com
        127.0.0.1 wiki.example.com www.wiki.example.com
        127.0.0.1 code.example.com www.code.example.com
```
Replace `127.0.0.1` with IP of host that `docker-compose` command run on it.

**Create Databases**
```
$ docker exec -it atlassian_database_1  psql -U postgres
       postgres=# CREATE DATABASE jira;
       postgres=# CREATE DATABASE wiki;
       postgres=# CREATE DATABASE bitbucket;
       postgres=# \l
       postgres-# \q
```

**Browse Atlassian products**
```
http://jira.example.com
http://wiki.example.com
http://code.example.com
```

Notes:
Persistent data is saved on docker volumes
```
$ docker volume ls

Example:

local               atlassian_bitbucket-data
local               atlassian_confluence-data
local               atlassian_jira-data
local               atlassian_database-data
```