**Run locally**  
with reload mode:

```
uvicorn sql_app.main:app --reload
```

without reload mode

```
uvicorn sql_app.main:app --host 0.0.0.0 --port 80
```

## Deploying to ec2 (ubuntu) manually

ssh to instance

```
ssh -i <key>.pem ubuntu@<dns>
```

main dependencies

```
sudo apt-get update
sudo apt-get install git
sudo apt install python3-pip
sudo apt-get install gunicorn
sudo apt-get install nginx
```

cloning the repo

```
git clone <url>
```

redirecting with nginx

```
cd /etc/nginx/sites-enabled/
sudo nano default
```

copy the following code into _default_ file

```
server{
    listen 80;
    server_name <ip>;
    location / {
        proxy_pass http://127.0.0.1:8000;
    }
}
```

restart nginx

```
sudo service nginx restart
```

change to our app dicrectory

```
cd ~./<name-folder>
```

install python requirements

```
pip3 install -r requirements.txt
```

probably for prod we need the next 2 dependencies

```
pip3 install uvloop
pip3 install httptools
```

run our app

```
gunicorn -w 1 -k uvicorn.workers.UvicornWorker <dir_app>.<file_app>:app
```

## Deploying to ECS
