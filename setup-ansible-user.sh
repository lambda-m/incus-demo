# Run as root on each VM or in your template once ;)
# Make sure you set your SSH public key here in this variable:
SSH_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQClUnXCNOqTtDnaPf2Oo2asf082yGGwNrpXFP7Xxzxm/f+B7hUnvsJ1OThSjOXpIdAeI6ZChCtRtmboQnCycZmbNz9/Vlx3M/fhIO9ilpDIY+IvltnpPLFFKQuFim4jKPdZfTpvFcvBTZ3IH7P8D3LElok00qGbS/XweML9LCd8bQvorrSMLBbWBii0gr2rgce3Zi+eOMJGUYsOit5uz/Tl2FyKubhPsjZVW7rqJheOzxrPFgb0iZ2OTq9tO8fyi8y+oO9mAqCbiJf+a3/iuU5hCyg2Eo3ArGHEbI234TlS8UQ3c8ChSHsPdjcZjJLO5/kPkI3vF3Ve2yDlWoGsX6FbrtfemwKL5Nv+Ix/jZeCHiINuNpSpmnGAO1Ago3iBRQkb4L5NQtYpi+rG+x6f4DPtbQuir80d78Qj5kBa3RSdWk9ErBuNR+z72YHItDWgPEvc2gfmR197Hna/W6xkwEpYBgtdX+PdBRC18p2MglaC5cN3LDntC/NwxdXGhTdLJ3KL58rDk2WkMEL+NddIVv6NlbWE8/QvP0kQxw+iDgPDl+t//U0tzi2MJjY/B9qj1U4w4SlDUrcGcs0fj2zziYONobEyDkWO7sNoyj8XeAOAZIGTybxsOTbjnfObr4Uj+ayq05bE4rK70eCj4m5iAicsRHZgcFR7H34XOZ2af5LbfQ== maarten@Maartens-MacBook-Pro.local"


useradd -m -s /bin/bash ansible
usermod -aG sudo ansible
mkdir -p /home/ansible/.ssh
chmod 700 /home/ansible/.ssh
echo "$SSH_KEY" > /home/ansible/.ssh/authorized_keys
chmod 600 /home/ansible/.ssh/authorized_keys
chown -R ansible:ansible /home/ansible/.ssh
echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible
chmod 440 /etc/sudoers.d/ansible