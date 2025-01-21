#!/bin/bash

# Start Xvfb (Virtual Framebuffer) to simulate a display
Xvfb :0 -screen 0 1080x1920x16 &
export DISPLAY=:0

# Start the Android emulator in the background
/opt/start-emulator.sh &

# Start websockify to bridge WebSocket to VNC server (localhost:5900)
websockify --web /usr/share/novnc/ 6080 localhost:5900 &
