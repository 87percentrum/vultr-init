# vultr-init
Scripts to get vultr instances up n running

I find myself doing the same old shit just about everytime I create a new instance so I decided to automate it instead.

## setup.sh
This creates a new user (umut:umut) and copies my ssh public key that is installed by Vultr from root to the new user, sets up shell access on a custom port, disables password auth, and lets the new user sudo without a password.

### Usage
I add a few lines of code to a startup script on vultr https://my.vultr.com/startup/
  	#!/bin/bash
	  # setup my user account
    
	  apt update && apt install git -y
    
	  git clone https://github.com/87percentrum/vultr-init.git /vultr
	  cd /vultr
	  chmod +x setup.sh
	  ./setup.sh
    
	  rm -R /vultr

Then select the script when creating a new instance.
