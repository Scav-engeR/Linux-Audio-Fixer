#!/bin/bash

# FixAudioSound.sh - Script to fix audio issues on Debian-based systems by installing necessary packages and restarting services.

# Update system packages
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install necessary audio packages
echo "Installing necessary audio packages..."
sudo apt install -y pulseaudio pavucontrol alsa-utils firmware-sof-signed

# Restart ALSA and PulseAudio
echo "Restarting ALSA and PulseAudio..."
sudo alsactl init
pulseaudio --kill
pulseaudio --start

# Unmute and set volumes in ALSA Mixer
echo "Unmuting sound in alsamixer..."
amixer sset Master unmute
amixer sset Speaker unmute
amixer sset Headphone unmute

# Check if PulseAudio is active
echo "Checking if PulseAudio is active..."
systemctl --user status pulseaudio

# Prompt to reboot system for changes to take effect
echo "Audio reconfiguration completed. Please reboot your system for changes to take effect."

exit 0
