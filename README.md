# toolbox
Various files I use on my systems.

### `75dual.sh`, `75hz.sh`, and `dual-display.sh`

These help me get multi-monitor stuff working when my laptop is plugged into my dock. The monitor doesn't do its advertised 75hz out of the box, so I need a script to overclock it. I combined the two to make things easier.

### `gpu-intel.sh` and `gpu-nvidia.sh`

My laptop has both Intel graphics and an Nvidia MX150. These scripts just switch between the two since Bumblebee, Primusrun, and all their derivatives never worked properly. They require `optimus-manager` to be installed.

### `i3status.conf`

1. Place in `/etc/`
2. Restart `i3`

### `mcrcon.sh`

Prompts for a password then uses RCON to connect to my [Minecraft](https://www.minecraft.net/en-us/) server console.

### `minecraft-start.sh`

Starts my [Minecraft](https://www.minecraft.net/en-us/) server.

### `mycroft.sh`

Reloads any audio stuff and sets defaults before launching [Mycroft](https://mycroft.ai/). I use Mycroft for an open-source smart home when combined with [Home Assistant](https://www.home-assistant.io/).

### `netsh-tool.bat`

Back when I worked in IT in a network with broken DNS, this was very helpful when troubleshooting systems or switching my work laptop from Ethernet to WiFi.

### `network.sh`

Because DigitalOcean STILL hasn't fixed the DNS resolution after reboot bug!

### `theme`

1. Place in `~/.Xresources.d/`
2. Add `#include ".Xresources.d/theme"` to `~/.Xresources`
3. Run `xrdb .Xresources` and restart the terminal

### `user_accounts.sh`

Got this from StackOverflow, not sure why, looks cool though.

### `vbox-start.sh`

Starts a virtual machine when I needed to run Windows garbage. I don't have my own Windows system because f**k that.

### `vinescrape.sh`

From when I was working on my project to scrape Vine. RIP.

### `wireguard-mullvad.sh`

I just got lazy of typing the same commands over and over, this could easily be an alias...

### `.bash_aliases`

Aliases I find useful because I am lazy and don't like typing redundant stuff... like these script descriptions...

### `.Xresources`

Probably does something helpful.