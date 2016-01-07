#!/bin/bash

# Setup password
mkdir /root/.vnc/
echo $VNC_PASSWD | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd

# Start vnc server
vncserver :1 -geometry 1280x800 -depth 24

# Run TRiBot
DISPLAY=:1 XAUTHORITY=/root/.Xauthority java -jar TRiBot_Loader.jar 2>&1 >> tribot_logs.log

tail -F /root/.vnc/*.log

