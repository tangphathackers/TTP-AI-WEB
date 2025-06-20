echo "😈 Device Doze++"  
cmd deviceidle whitelist >/dev/null 2>&1 && echo "🎮 Running..." || {
echo "❌ Not running. Exiting."
exit
}
# Thực hiện công việc cho lựa chọn 5
idle() {
# Xóa tất cả các ứng dụng khỏi whitelist
for app in $(cmd deviceidle whitelist | cut -f2 -d,); do
cmd deviceidle sys-whitelist "-$app"
cmd deviceidle whitelist "-$app"
done
# Thêm các ứng dụng audio, systemui, và các gói có hậu tố android vào whitelist
for pkg in $(cmd package list packages | grep -E 'audio|systemui|:android$|facebook|ugc|revanced|rv|ia.mo|knox|server|samsung' | cut -f2 -d:); do
cmd deviceidle except-idle-whitelist "+$pkg"
cmd deviceidle whitelist "+$pkg"
done
# Kích hoạt chế độ idle
cmd deviceidle enable
cmd deviceidle force-idle
cmd deviceidle step
execute_global() {
settings put global "$1" "$2"
}
execute_global window_move_animation_scale 0.78
execute_global window_move_animation_duration_scale 0.78
execute_global display_animation_scale 0.78
execute_global display_animation_duration_scale 1.12
execute_global transition_animation_scale 0.78
execute_global transition_animation_duration_scale 1.12
execute_global window_animation_scale 0.78
execute_global window_animation_duration_scale 0.78
execute_global animator_scale 1.12
execute_global animator_duration_scale 1.12
execute_global animation_scale_window_transition 0.78
execute_global animation_scale_animator_duration 1.12
execute_global app_transition_animation_scale 0.78
execute_global app_transition_animation_duration_scale 1.12
execute_global recent_app_transition_scale 1
execute_global recent_app_transition_duration_scale 1.12
sleep 0.3
}
idle >/dev/null 2>&1 && echo "➡️ Success" || echo "➡️ Failed"
