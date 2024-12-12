# For some reason this works without the shebang? Alright
# A script to set a random wallpaper on startup

prefix="/home/charm/.dotfiles/home/hypr/Wallpapers"
# Declare all wanted wallpapers here
wallpapers=("${prefix}/436854.jpg" "${prefix}/Heaven Piercer.jpg" "${prefix}/Space Travel.jpg")

# Roll the die
i=$((RANDOM % ${#wallpapers[@]}))

# Run hyprpaper
hyprpaper
# Load and set
hyprctl hyprpaper preload "${wallpapers[$i]}"
hyprctl hyprpaper wallpaper ", ${wallpapers[$i]}"
