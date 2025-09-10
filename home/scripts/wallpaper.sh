# For some reason this works without the shebang? Alright
# A script to set a random wallpaper on startup

prefix="$HOME/.dotfiles/home/hypr/Wallpapers"
# Declare all wanted wallpapers here
wallpapers=("${prefix}/129850683_p0.png" "${prefix}/1354207.jpeg" "${prefix}/134223443_p0.jpg" "${prefix}/1358147.png" "${prefix}/9.jpg" "${prefix}/1310702.png")

# Roll the die
i=$((RANDOM % ${#wallpapers[@]}))

# Run hyprpaper
pkill hyprpaper
hyprpaper &
# Load and set
sleep 1 # This part is important, else next step fails
hyprctl hyprpaper preload "${wallpapers[$i]}"
hyprctl hyprpaper wallpaper ", ${wallpapers[$i]}"
