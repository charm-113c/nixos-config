# For some reason this works without the shebang? Alright
# A script to set a random wallpaper on startup

prefix="$HOME/.dotfiles/home/hypr/Wallpapers"
# Declare all wanted wallpapers here
wallpapers=("${prefix}/129850683_p0.png" "${prefix}/116644974_p0.png" "${prefix}/131409687_p0.jpg" "${prefix}/1358147.png" "${prefix}/135100174_p0.jpg" "${prefix}/1310702.png" "${prefix}/104651378_p0.jpg")

# Roll the die
i=$((RANDOM % ${#wallpapers[@]}))

# Run hyprpaper
pkill hyprpaper
hyprpaper &
# Load and set
sleep 1 # This part is important, else next step fails
hyprctl hyprpaper preload "${wallpapers[$i]}"
hyprctl hyprpaper wallpaper ", ${wallpapers[$i]}"
