
#############
MASTER Config
#############
# Configure Master to run Smokeping on OpnSense Slave

# File: /etc/smokeping/config.d/Slaves

+opnsense
display_name=opnsense
location=Inline
color=ff8080
++override
Probes.FPing.binary = /usr/local/sbin/fping

###########################
RUN SMOKEPING IN SLAVE MODE
###########################

# run smokeping as user on opnsense box in slave mode

echo "myverysecret" > $HOME/opt/smokeping/etc/slavesecret
chmod 0600 $HOME/opt/smokeping/etc/slavesecret

mkdir -p $HOME/opt/smokeping/var/lib/smokeping
mkdir -p $HOME/opt/smokeping/var/run/smokeping

cd $HOME/opt/smokeping/bin
./smokeping \
    --master-url=https://my.smokeping.master.host.example.com:443 \
    --shared-secret=../etc/slavesecret \
    --slave-name=opnsense-slave \
    --cache-dir=../var/lib/smokeping \
    --pid-dir=../var/run/smokeping
