options="󰍃 Logout\n󰜉 Reboot\n󰐥 Shutdown\n󰌾 Lock\n⏾ Suspend\n󰅖 Cancel"

chosen=$(echo -e "$options" | wofi --dmenu)

case $chosen in
"󰍃 Logout")
  hyprctl dispatch exit
  ;;
"󰜉 Reboot")
  reboot
  ;;
"󰐥 Shutdown")
  shutdown now
  ;;
"󰌾 Lock")
  hyprlock
  ;;
"⏾ Suspend")
  systemctl suspend
  ;;
*)
  exit 1
  ;;
esac
