alias disksize="df -h | egrep '/dev/nvme0n1p2|/dev/sda1|/dev/sdb1|Avail'"
alias dirsize="du -h --max-depth=1 ."
alias ytdl-plist='youtube-dl --extract-audio --audio-format mp3 -i -o "%(title)s.%(ext)s"'
alias set-media-perms="sudo chown -R emby:shared . && sudo chmod -R ug+rwx,o+rx,o-w ."
