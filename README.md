## EQ 2 Sqlite

Convert takp & quarm databases to sqlite with [mysql-to-sqlite3](https://github.com/techouse/mysql-to-sqlite3)

```bash
docker build -t eq2sqlite .
docker run --rm -it -v `pwd`:/tmp/out eq2sqlite SecretsOTheP/EQMacEmu quarm_2025-01-14-03_55.tar.gz
docker run --rm -it -v `pwd`:/tmp/out eq2sqlite EQMacEmu/Server alkabor_2025-02-26-08_44.tar.gz
```
