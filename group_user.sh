#!/usr/bin/env bash

# ===================== CONFIG =====================
echo "Mise à jour des groupes"

sudo groupadd namma-dsf
sudo usermod -aG namma-dsf namma
sudo usermod -aG namma-dsf dsf
sudo chown -R dsf:namma-dsf /opt/dsf/sd
sudo find /opt/dsf/sd -type d -exec chmod 2775 {} \;
sudo find /opt/dsf/sd -type f -exec chmod 664 {} \;
sudo setfacl -R -m u:namma:rwx,u:dsf:rwx /opt/dsf/sd
sudo setfacl -R -d -m u:namma:rwx,u:dsf:rwx /opt/dsf/sd

echo "Groupes mis à jour !"
