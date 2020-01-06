## indexyz.wireguard

[![Build Status](https://travis-ci.org/X01A/wireguard.svg?branch=master)](https://travis-ci.org/X01A/wireguard)

Setup wireguard mesh networking quickly

### Requirement

System should allow dkms to load wireguard kernel extensions.

### Role Variables

| Name           | Default | Type    | Description                                |
|----------------|---------|---------|--------------------------------------------|
| mtu            | 1420    | Number  | Wireguard network interface mtu            |
| ip_cidr_range  | 16      | Number  | Wireguard subnetwork size                  |
| listen_port    | 32091   | Number  | Wireguard listen port                      |
| inte_ip        | None    | String? | Wireguard interface ip (i.e. 10.255.255.1) |
| interface_name | wg0     | String  | Wireguard interface name                   |

### Example Playbook

Invetony

```
[wireguard]
server1 inte_ip=10.0.255.1
server2 inte_ip=10.0.255.2
```

Playbook

```yaml
---
- hosts: wireguard
  remote_user: root
  roles:
    - indexyz.wireguard
```

### License

MIT
