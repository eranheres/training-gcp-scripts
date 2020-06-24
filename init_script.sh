cd ~
sudo mkdir -p /mnt/disks/sdb
sudo mount -o discard,defaults /dev/sdb /mnt/disks/sdb/
git clone https://github.com/eranheres/adaptive-style-transfer.git
cd adaptive-style-transfer
ln -s /mnt/disks/sdb/ ./data/
mkdir ~/uploads
mkdir ~/downloads
