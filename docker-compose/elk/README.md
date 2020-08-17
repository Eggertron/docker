# ELK Stack

## rsyslog client confit
Log into a client host and create this file /etc/rsyslog.d/10-elk_stack.conf or add to /etc/rsyslog.conf
```
*. *  @192.168.10.210:514
```
if you are using TCP instead of UDP then use two @@ signs instead of one like this
```
*. *  @@remote-elk-host:514
```
Then restart and enable the service
```
systemctl restart rsyslog && systemctl enable rsyslog
