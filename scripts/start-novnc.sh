#!/bin/bash

# Start Xvfb (Virtual Framebuffer) to simulate a display
Xvfb :0 -screen 0 1080x1920x16 &
export DISPLAY=:0

# Start the Android emulator in the background
/opt/start-emulator.sh &

# Start noVNC server
/opt/novnc/utils/launch.sh --vnc localhost:5900 --listen 6080 &
wait
