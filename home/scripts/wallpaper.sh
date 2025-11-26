# For some reason this works without the shebang? Alright
# A script to set a random wallpaper on startup

prefix="$HOME/.dotfiles/home/hypr/Wallpapers"
# Declare all wanted wallpapers here
wallpapers=("${prefix}/129850683_p0.png" "${prefix}/127659704_p1.png" "${prefix}/131409687_p0.jpg" "${prefix}/56436213_p0.png" "${prefix}/Vanguard.png" "${prefix}/136998207_p0.jpg")

# Roll the die
i=$((RANDOM % ${#wallpapers[@]}))

# Run hyprpaper
pkill hyprpaper
hyprpaper &
# Load and set
sleep 1 # This part is important, else next step fails
hyprctl hyprpaper preload "${wallpapers[$i]}"
hyprctl hyprpaper wallpaper ", ${wallpapers[$i]}"
