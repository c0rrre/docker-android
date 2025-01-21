#!/bin/bash

# Start websockify to bridge WebSocket to VNC server (localhost:5900)
echo "Starting websockify..."
websockify --web /usr/share/novnc/ 6080 localhost:5900 &
echo "noVNC is now available on port 6080."
