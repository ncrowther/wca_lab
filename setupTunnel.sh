
## script to generate public and private key using user's initials

read -p "Enter your initials: " INITIALS

privkey="${INITIALS}_rsa"
pubkey="${INITIALS}_rsa.pub"

ssh-keygen -t rsa -f ${privkey}

scp ${pubkey} ncrowther@192.168.0.207:.

ssh ncrowther@192.168.0.207

# On the remote system enter: 
# cat [INITIALS]_rsa.pub >> ~/.ssh/authorized_keys
# Exit the remote session by hitting Ctl-d
# Back in the original terminal, should be able to SSH to your remote account from the computer without supplying a password. Check this by typing:
# ssh root@192.168.0.207

###############
# Ubuntu notes
###############
# cp NTC_rsa ~/.ssh
#
# Login as SU
# sudo -i 
#
# Make sure the PubkeyAuthentication option is set to yes in the SSH server's configuration file (/etc/ssh/sshd_config). You can edit this file using sudo nano /etc/ssh/sshd_config and then restart the SSH service using sudo systemctl restart sshd.
# Set appropriate permissions for the .ssh directory and authorized_keys file on the server: 
#
#   chmod 700 ~/.ssh
#   chmod 600 ~/.ssh/authorized_keys
#
#    Now, you can use the following command to log in: 
#
#    ssh -i ~/.ssh/id_rsa user@your_server_ip
#
# ssh -i ~/.ssh/NTC_rsa ncrowther@192.168.0.207
#
# ansible-playbook -i inventory.ini installCockpitComplete.yml -kK