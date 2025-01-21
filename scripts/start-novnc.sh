#!/bin/bash

# Start websockify to bridge WebSocket to VNC server (localhost:5900)
echo "Starting websockify..."
websockify --web /usr/share/novnc/ 6080 localhost:5900 &
echo "noVNC is now available on port 6080."

# Wait for the Android emulator to be ready
echo "Waiting for the Android emulator to be ready..."
sleep 5

# Start the VNC server (if not already started)
echo "Starting VNC server..."
x11vnc -forever -usepw -display :0 &

# Start noVNC (the client that connects to websockify)
echo "Starting noVNC..."
/usr/share/novnc/novnc_server --vnc localhost:5900 --listen 6080 &

echo "noVNC is now available on port 6080."
wait