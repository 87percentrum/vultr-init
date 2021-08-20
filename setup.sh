#!/bin/bash
# setup my user account

NEWUSER="umut"

adduser --disabled-password --gecos "" $NEWUSER

cp -R /root/.ssh /home/$NEWUSER

chown -R $NEWUSER:$NEWUSER /home/$NEWUSER/.ssh

printf "Port 1982\nPasswordAuthentication no\nPubkeyAuthentication yes\nAcceptEnv LANG LC_*\nPrintMotd no\nX11Forwarding yes\nUsePAM yes\nPermitRootLogin yes\nPermitRootLogin yes\nSubsystem       sftp    /usr/lib/openssh/sftp-server\nMatch group sftp\nX11Forwarding no\nAllowTCPForwarding no\nForceCommand internal-sftp%s" "" > /etc/ssh/sshd_config
service ssh restart

printf "\n%s ALL=(ALL) NOPASSWD:ALL" $NEWUSER >> /etc/sudoers
