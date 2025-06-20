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
sleep 0.3
}
idle >/dev/null 2>&1 && echo "➡️ Success" || echo "➡️ Failed"
