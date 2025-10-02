ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -C "client to servers" -N ''


ssh-copy-id -i ~/.ssh/id_ed25519.pub <serv1_username>@<serv1_ip>
ssh-copy-id -i ~/.ssh/id_ed25519.pub <serv2_username>@<serv2_ip>

