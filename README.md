## EQ 2 Sqlite

Convert quarm database to sqlite with [mysql-to-sqlite3](https://github.com/techouse/mysql-to-sqlite3)

```bash
docker build -t eq2sqlite .
docker run --rm -it -v `pwd`:/tmp/out eq2sqlite quarm_2023-08-28-22_03.tar.gz
```
