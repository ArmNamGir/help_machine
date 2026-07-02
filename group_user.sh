#!/usr/bin/env bash
# ===================== CONFIG =====================
echo "=== Configuration des permissions namma-dsf ==="

echo "[1/4] Création du groupe namma-dsf..."
sudo groupadd namma-dsf
echo "[2/4] Ajout des utilisateurs namma et dsf au groupe..."
sudo usermod -aG namma-dsf namma
sudo usermod -aG namma-dsf dsf

echo "[3/4] Application des propriétaires et permissions sur /opt/dsf/sd..."
sudo chown -R dsf:namma-dsf /opt/dsf/sd
sudo find /opt/dsf/sd -type d -exec chmod 2775 {} \;
sudo find /opt/dsf/sd -type f -exec chmod 664 {} \;

echo "[4/4] Configuration des ACL..."
sudo setfacl -R -m u:namma:rwx,u:dsf:rwx /opt/dsf/sd
sudo setfacl -R -d -m u:namma:rwx,u:dsf:rwx /opt/dsf/sd

echo "=== Terminé ! Groupes et permissions mis à jour ==="
