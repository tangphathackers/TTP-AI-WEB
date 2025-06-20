Semua_Reset()
{
settings reset global semua
settings reset secure semua
}
Semua_Reset >/dev/null 2>&1
reset() {
for a in $(cmd package list packages|cut -f2 -d:)
do cmd appops reset "$a"&cmd deviceidle whitelist "-$a"&done
for c in $(cmd device_config list|cut -f1 -d=)
do cmd device_config delete "${c%/*}" "${c#*/}"&done
cmd deviceidle disable
cmd deviceidle except-idle-whitelist reset
cmd deviceidle sys-whitelist reset
cmd settings delete global angle_gl_driver_all_angle
cmd settings delete global game_driver_all_apps
cmd settings delete global updatable_driver_all_apps
cmd window density reset
cmd window size reset
settings put global heads_up_notifications_enabled 1
cmd compile --reset com.android.systemui
for app in $(cmd package list packages | cut -f2 -d: | sort); do
am set-inactive "$app" false
done
}
reset >/dev/null 2>&1 &
echo "🥰 Reboot Device"
