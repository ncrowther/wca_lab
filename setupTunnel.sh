## script to generate public and private key using user's initials

read -p "Enter your initials: " INITIALS

privkey="${INITIALS}_rsa"
pubkey="${INITIALS}_rsa.pub"

ssh-keygen -t rsa -f ${privkey}

scp ${pubkey} root@158.175.108.28:.

ssh root@158.175.108.28

