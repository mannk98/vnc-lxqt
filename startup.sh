#!/bin/bash

USER='mannk'
HOME='/home/mannk'

echo "VNC machine starting ..."

sudo mkdir /var/run/sshd

# vncpasswd form docker run -e
[[ ! -f /root/.vnc/passwd ]] && {
  sudo mkdir /root/.vnc
  sudo x11vnc -storepasswd ${vncpasswd} /root/.vnc/passwd
}

sudo supervisord -c "${HOME}/.startup_conf/supervisord.conf"

#sudo -u ${USER} ibus start & >${HOME}/.startup_conf/ibus-start.log

echo "VNC machine starting done."
while [ 1 ]; do
    /bin/bash
done
