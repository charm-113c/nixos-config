# For some reason this works without the shebang? Alright
# A script to set a random wallpaper on startup

prefix="$HOME/.dotfiles/home/hypr/Wallpapers"
# Declare all wanted wallpapers here
wallpapers=("${prefix}/1140292.jpg" "${prefix}/Heaven Piercer.jpg" "${prefix}/Where Dreams Start.jpg" "${prefix}/Nenechi January 2025.png" "${prefix}/Challenge.png")

# Roll the die
i=$((RANDOM % ${#wallpapers[@]}))

# Run hyprpaper
pkill hyprpaper
hyprpaper &
# Load and set
sleep 1 # This part is important, else next step fails
hyprctl hyprpaper preload "${wallpapers[$i]}"
hyprctl hyprpaper wallpaper ", ${wallpapers[$i]}"
