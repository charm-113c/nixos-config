# For some reason this works without the shebang? Alright
# A script to set a random wallpaper on startup

prefix="$HOME/.dotfiles/home/hypr/Wallpapers"
# Declare all wanted wallpapers here
wallpapers=("${prefix}/936338.png" "${prefix}/8.jpg" "${prefix}/1395755.png" "${prefix}/1338111.png" "${prefix}/1358147.png" "${prefix}/9.jpg")

# Roll the die
i=$((RANDOM % ${#wallpapers[@]}))

# Run hyprpaper
pkill hyprpaper
hyprpaper &
# Load and set
sleep 1 # This part is important, else next step fails
hyprctl hyprpaper preload "${wallpapers[$i]}"
hyprctl hyprpaper wallpaper ", ${wallpapers[$i]}"
