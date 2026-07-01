# For some reason this works without the shebang? Alright
# A script to set a random wallpaper on startup

prefix="$HOME/.dotfiles/home/hypr/Wallpapers"
# Declare all wanted wallpapers here
wallpapers=("${prefix}/436854.jpg" "${prefix}/606206.png" "${prefix}/143840684_p0.png" "${prefix}/1354207.jpeg" "${prefix}/Space Travel.jpg" "${prefix}/127659704_p1.png" "${prefix}/144144991_p0.jpg" "${prefix}/144251177_p0.jpg" "${prefix}/Heaven Piercer.jpg")

# Roll the die
i=$((RANDOM % ${#wallpapers[@]}))

# Use awww instead
# awww kill # In case daemon is active
awww-daemon &

awww img "${wallpapers[$i]}" & #--resize=stretch &
# Run hyprpaper
# pkill hyprpaper
# hyprpaper &
# Load and set
# sleep 1 # This part is important, else next step fails
# hyprctl hyprpaper preload "${wallpapers[$i]}" # Ok so as of 2026 no preloads are needed, but more options are
# hyprctl hyprpaper wallpaper ", ${wallpapers[$i]}"
# hyprctl hyprpaper wallpaper "HDMI-A-1, ${wallpapers[$i]}"
