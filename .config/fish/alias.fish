abbr --add cp 'cp -i' # confirm before overwriting something
abbr --add df 'df -h' # human-readable sizes
abbr --add free 'free -m' # show sizes in MB
abbr --add more less
abbr --add vim nvim
abbr --add svim sudoedit
abbr --add sf 'clear && pfetch'
abbr --add swaytree 'swaymsg -t get_tree | grep -E '\''app_id|name|shell'\'''
abbr --add cls clear
abbr --add wget 'wget --hsts-file='\''$XDG_DATA_HOME/wget-hsts'\'''
abbr --add unp 'unp -U'

abbr --add grep 'grep --colour=auto'
abbr --add egrep 'egrep --colour=auto'
abbr --add fgrep 'fgrep --colour=auto'

abbr --add ls 'eza --icons=auto'
abbr --add ll 'eza -alghF --octal-permissions --group-directories-first --icons=auto'
abbr --add la 'eza -a --group-directories-first --icons=auto'
abbr --add l 'eza -F --group-directories-first --icons=auto'
abbr --add lss 'eza -lr --sort=size'
abbr --add lsm 'eza -lr --sort=mod'
abbr --add lst 'eza --tree --level=2'

abbr --add pacman 'sudo pacman'
abbr --add pacs 'sudo pacman -S'
abbr --add paci 'sudo pacman -Qi'
abbr --add pacr 'sudo pacman -Rns'
abbr --add pacro 'sudo pacman -Qtdq | sudo pacman -Rns -'

# list unrequierd, not in base (run pacman first for sudo password)
abbr --add pacru 'comm -23 <(pacman -Qqt | sort) <(pacman -Qqg base | sort)'

abbr --add pacu 'sudo pacman -Syu'
abbr --add pacmu 'sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
abbr --add yas 'yay -S --noconfirm'
abbr --add yau 'yay -Syu --noconfirm'

abbr --add ytl 'yt-dlp -F'
abbr --add yta 'yt-dlp -x -f ba --audio-quality 0 --audio-format mp3'
abbr --add ytv 'yt-dlp -f "bv*[height<=720]+ba"' #720p 60fps or 720p 30fps

abbr --add public-ip 'curl ifconfig.me'
abbr --add private-ip 'ip a show wlan0 | awk '\''{print $2}'\'' | sed -n '\''3p'\'''
