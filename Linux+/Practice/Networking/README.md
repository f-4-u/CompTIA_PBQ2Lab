# Tasks

Fill the gaps

```bash
user@powerstation:~$ ____ ____ ____ ____
eth0: <> mtu 1500 group default qlen 1
inet 192.168.1.25/24 brd 192.168.1.255 scope global dynamic valid_lft 80956 sec prefered_lft 80956 sec
user@powerstation:~$ ____
powerstation
user@powerstation:~$ ____ /etc/resolv.conf
nameserver 8.8.8.8
nameserver 8.8.4.4
user@powerstation:~$ ____ www.google.com

Server: 8.8.8.8
Address: 8.8.8.8#53
Non-authoritative answer:
Name: www.google.com
Address: 64.233.177.104

user@powerstation:~$ ____ www.google.com

www.google.com has address 64.233.177.104

user@powerstation:~$ ____ 64.233.177.104
64 bytes from 64.233.177.104: icmp_seq=1 ttl=44 time 4ms
64 bytes from 64.233.177.104: icmp_seq=2 ttl=44 time 4ms
64 bytes from 64.233.177.104: icmp_seq=3 ttl=64 time 384ms
Request timed out.
Control-C
```

## Additional

You can use the `validate` command inside the container to prove your results and `tasks` to review your tasks.
