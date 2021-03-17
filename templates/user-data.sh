#!/bin/bash
apt-get update && apt-get dist-upgrade -y
apt-get install mosh wireguard -y
rm -rf /var/cache/apt/*
cd /etc/wireguard

echo -n "net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr" > /etc/sysctl.d/bbr.conf

echo -n "net.ipv4.ip_forward=1
net.ipv6.conf.all.forwarding=1" > /etc/sysctl.d/wireguard.conf

wg genkey | tee privatekey | wg pubkey > publickey
chmod 400 privatekey publickey

echo "[Interface]
Address = ${wireguard_server_private_ip}
SaveConfig = false
ListenPort = ${wireguard_port}
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE; ip6tables -A FORWARD -i wg0 -j ACCEPT; ip6tables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE; ip6tables -D FORWARD -i wg0 -j ACCEPT; ip6tables -t nat -D POSTROUTING -o eth0 -j MASQUERADE" > wg0.conf


echo "PrivateKey =" $(cat privatekey) >> wg0.conf

systemctl enable unbound
systemctl enable wg-quick@wg0
mkdir -p /etc/systemd/system/wg-quick@wg0.service.d
echo "[Unit]
After=network.target
Before=unbound.service" > /etc/systemd/system/wg-quick@wg0.service.d/override.conf
systemctl daemon-reload
reboot
