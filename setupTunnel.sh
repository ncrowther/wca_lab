## script to generate public and private key using user's initials

read -p "Enter your initials: " INITIALS

privkey="${INITIALS}_rsa"
pubkey="${INITIALS}_rsa.pub"

ssh-keygen -t rsa -f ${privkey}

scp ${pubkey} root@158.175.108.28:.

ssh root@158.175.108.28

# On the remote system enter: 
# cat [INITIALS]_rsa.pub >> ~/.ssh/authorized_keys
# Exit the remote session by hitting Ctl-d
# Back in the original terminal, should be able to SSH to your remote account from the computer without supplying a password. Check this by typing:
# ssh root@158.175.108.28