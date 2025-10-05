

# set up private key authentication

ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -C "client to servers" -N ''


ssh-copy-id -i ~/.ssh/id_ed25519.pub <serv1_username>@<serv1_ip>
ssh-copy-id -i ~/.ssh/id_ed25519.pub <serv2_username>@<serv2_ip>



# serve apache webpage

sudo apt update
sudo apt install apache2 -y
sudo systemctl status apache2
sudo rm /var/www/html/index.html
echo '<h4> hi this is jack and youve reached my ubunut server!!!!!!!!!<h4>' | sudo tee /var/www/html/index.html


# install curl

sudo apt update
sudo apt install curl -y
curl http://localhost




# configure firewall

sudo apt update
sudo apt install ufw -y
sudo ufw status verbose
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 'Apache'


sudo ufw enable
sudo ufw status numbered



# install python

sudo apt update
sudo apt install -y python3-pip
pip3 --version
sudo apt install -y python3-venv
python3 -m venv .venv
source .venv/bin/activate