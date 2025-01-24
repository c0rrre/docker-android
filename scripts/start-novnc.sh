#!/bin/bash

# Start the Android emulator (if not already started)
echo "Starting Android emulator..."
/opt/start-emulator.sh &

# Wait for the Android emulator to be ready
echo "Waiting for the Android emulator to be ready..."
sleep 5

# Start the VNC server (if not already started)
echo "Starting VNC server..."
x11vnc -display :0 -forever -usepw -listen localhost -noipv6 &

# Start websockify to bridge WebSocket to VNC server (localhost:5900)
echo "Starting websockify..."
websockify --web /usr/share/novnc/ 6080 localhost:5900 &

echo "noVNC is now available on port 6080."
wait
