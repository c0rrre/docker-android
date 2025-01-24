#!/bin/bash

# Start the Android emulator (if not already started)
echo "Starting Android emulator..."
/opt/start-emulator.sh &

# Wait for the Android emulator to be ready
echo "Waiting for the Android emulator to be ready..."
sleep 10

# Start the VNC server (if not already started)
echo "Starting VNC server..."
x11vnc -display :0 -forever -listen 0.0.0.0 -noipv6 &

# Wait a bit to ensure VNC server is ready
sleep 5

# Start websockify to proxy VNC over WebSocket for noVNC
echo "Starting websockify..."
websockify --web /usr/share/novnc/ 6080 localhost:5900 &

echo "noVNC is now available on port 6080."
wait
