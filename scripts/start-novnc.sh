#!/bin/bash

# Start the Android emulator (if not already started)
echo "Starting Android emulator..."
/opt/start-emulator.sh &

# Wait for the Android emulator to be ready
echo "Waiting for the Android emulator to be ready..."
sleep 5

# Start the VNC server (if not already started)
echo "Starting VNC server..."
x11vnc -display $DISPLAY -forever -listen 0.0.0.0 -noipv6 &

# Wait a bit to ensure VNC server is ready
sleep 5

# Start noVNC (the client that connects to websockify)
echo "Starting noVNC..."
/usr/share/novnc/utils/launch.sh --vnc localhost:5900 --listen 6080 &

echo "noVNC is now available on port 6080."
wait
