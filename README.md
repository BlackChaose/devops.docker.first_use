# devops.docker.first_use
Simple example of docker use

---
```shell script
:> /etc/systemd/system/my-project.service
systemctl daemon-reload
sudo systemctl edit --full my-project.service
```

```shell script
[Unit]
Description=my first docker service
Requires=docker.service
After=docker.service

[Service]
Restart=always
RestartSec=3
ExecStartPre=/bin/sh -c "/usr/bin/docker rm -f bear85/my-project 2> /dev/null || /bin/true"
ExecStart=/usr/bin/docker run --rm -a STDIN -a STDOUT -a STDERR -p 8899:80 -v etc:/etc -v my-project:/var/www/html bear85/my-project
ExecStop=/usr/bin/docker stop my-project

[Install]
WantedBy=multi-user.target
```

``` shell script
sudo systemctl start my-project
```
