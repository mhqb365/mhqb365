## static server

```
server {
    listen 80;
    server_name <domain>;
    root /<dir>;
    index index.html;
    location / {
        try_files $uri $uri/ /index.html;
    }
}
```

## host server

```
server {
    listen 80;
    server_name <domain>;
    location / {
        proxy_pass http://localhost:8000;
    }
}
```

## redirect domain

```
server {
    listen 80;
    server_name <domain 1>;
    return 301 <domain 2>$request_uri; 
}
```