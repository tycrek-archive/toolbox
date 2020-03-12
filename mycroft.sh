#!/bin/sh

# Reload any drivers, just in case
echo Reloading drivers...
sudo alsa force-reload

echo Setting audio defaults...

# Set default Source (microphone)
pactl set-default-source alsa_input.usb-Cyber_Cyber_Acoustics_USB_device_13000001-00.analog-stereo

# Set default Sink (speaker)
pactl set-default-sink alsa_output.pci-0000_0a_00.3.analog-stereo

# Start Mycroft
echo Starting Mycroft...
cd /home/admin/programs/mycroft-core/
./start-mycroft.sh all
