# Docker zabbix-appliance 執行與資料庫還原的方式

## 執行 zabbix-appliance

```bash
# port 161 是 SNMP
docker run \
--name zbx -p 80:80 -p 10051:10051 -p 161:161 \
-e PHP_TZ="Asia/Taipei" \
-d zabbix/zabbix-appliance:ubuntu-latest
```

### Copy backup.sql to containcer

`docker cp zbx.sql CONTAINER:/tmp`

### exec bash in containcer

`docker exec -it CONTAINER bash`

### Restore backup.sql

zabbix-appliance 預設的帳號密碼皆為 zabbix，而 -p 之後接上去的 zabbix 為資料庫   
`mysql -u zabbix -p zabbix < zbx.sql`
提示字元出來輸入密碼 zabbix 等候還原資料完成   

### 如果還原資料庫有問題，可能是因為升級產生的版本不同

進入資料庫，並更新資料，mandatory 須注意會不同
`mysql -u zabbix -p `
`update dbversion set mandatory=4020000;`

### Reference:
<https://www.itread01.com/content/1541922436.html>