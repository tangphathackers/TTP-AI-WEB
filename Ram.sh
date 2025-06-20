Kill_ram() {
am kill-all
cmd activity kill-all
} >/dev/null 2>&1
Kill_ram
# Lấy tổng RAM và RAM khả dụng (MB)
total_ram=$(grep MemTotal /proc/meminfo | awk '{printf "%.0f", $2/1024}')
available_ram=$(grep MemAvailable /proc/meminfo | awk '{printf "%.0f", $2/1024}')
echo "🇻🇳 Tổng RAM (Total Ram): ${total_ram} MB"
echo "🇻🇳 RAM khả dụng (Available Ram): ${available_ram} MB"
# Hàm tối ưu hóa RAM đa nhiệm
optimize_ram_settings() {
local max_cached=$1
local max_running=$2
local phantom=$3
local cpu1=$4
local cpu2=$5
local cpu3=$6
local cpu4=$7
echo "⚙️ TTP-Ram Ultimate Final Tweaks"
echo "🇻🇳 Developer Telegram: @tangphat"
cmd device_config set_sync_disabled_for_tests persistent
cmd device_config put activity_manager max_cached_processes "$max_cached"
cmd device_config put activity_manager trim_empty_apps false
cmd device_config put activity_manager trim_caching_apps false
cmd device_config put activity_manager background_settle_time 999999999
cmd device_config put activity_manager fgservice_min_shown_time 999999999
cmd device_config put activity_manager fgservice_min_report_time 999999999
cmd device_config put activity_manager fgservice_screen_on_before_time 999999999
cmd device_config put activity_manager power_check_max_cpu_1 "$cpu1"
cmd device_config put activity_manager power_check_max_cpu_2 "$cpu2"
cmd device_config put activity_manager power_check_max_cpu_3 "$cpu3"
cmd device_config put activity_manager power_check_max_cpu_4 "$cpu4"
cmd device_config put activity_manager fg_to_bg_fgs_grace_duration 999999999
cmd device_config put activity_manager bg_start_timeout 999999999
cmd device_config put activity_manager service_restart_duration 180000
cmd device_config put activity_manager bservice_reset_run_duration 300000
cmd device_config put activity_manager service_bg_activity_start_timeout 600000
cmd device_config put activity_manager bound_service_max_crash_retry 10
cmd device_config put activity_manager process_start_async true
cmd device_config put activity_manager kill_bg_restricted_cached_idle false
# Activity Manager
device_config put activity_manager max_phantom_processes 2147483647
device_config put activity_manager phantom_processes_enabled false
device_config put activity_manager use_phantom_process_state false
device_config put activity_manager fgservice_limit_in_bg false
# Battery / Adaptive
device_config put adaptive_battery adaptive_battery_enabled false
device_config put battery adaptive_policy_enabled false
device_config put battery adaptive_timeout_enabled false
device_config put battery adaptive_restriction_enabled false
# Thermal
device_config put thermal_service enable_uid_bps_limiter false
device_config put thermal_service enable_uid_cpu_limiter false
device_config put thermal_service enable_uid_gpu_limiter false
device_config put thermal_service enable_uid_io_limiter false
settings put global app_auto_restriction_enabled 0
settings put global forced_app_standby_for_small_battery_enabled 0
settings put global cached_apps_freezer enabled
settings put global low_ram false
setprop debug.purgeable_assets 1
setprop debug.ui.hw true
settings put global app_standby_enabled 0
settings put global adaptive_battery_management_enabled 0
settings delete global battery_saver_constants >/dev/null 2>&1
settings put global low_power 0
settings put global max_running_processes "$max_running"
settings put global max_cached_processes "$max_cached"
settings put global background_process_limit "$max_running"
settings put global max_phantom_processes "$phantom"
settings put global no_kill_cached_processes_until_boot_completed true
settings put global kill_bg_restricted_cached_idle false
settings put global no_kill_cached_processes_until_boot_completed true
settings put global forced_app_standby_for_small_battery_enabled 0
}
# Chọn cấu hình phù hợp theo tổng RAM
if [ "$total_ram" -ge 15500 ]; then
# Trên 6GB RAM – Cấu hình mạnh nhất
optimize_ram_settings 32768 512 2147483647 64 64 64 64
elif [ "$total_ram" -ge 11500 ]; then
# Trên 6GB RAM – Cấu hình mạnh nhất
optimize_ram_settings 16384 256 2147483647 64 64 32 32
elif [ "$total_ram" -ge 7500 ]; then
# Trên 6GB RAM – Cấu hình mạnh nhất
optimize_ram_settings 8192 128 2147483647 64 64 32 16
elif [ "$total_ram" -ge 5500 ]; then
# 5GB đến 6GB RAM – Cấu hình cao
optimize_ram_settings 4096 64 2147483647 64 32 16 8
elif [ "$total_ram" -ge 3500 ]; then
# 3GB trở xuống – Cấu hình nhẹ
optimize_ram_settings 2048 32 32 32 32 16 8
elif [ "$total_ram" -ge 2500 ]; then
# 3GB trở xuống – Cấu hình nhẹ
optimize_ram_settings 1024 16 16 16 16 8 8
elif [ "$total_ram" -le 1500 ]; then
# 3GB trở xuống – Cấu hình nhẹ
optimize_ram_settings 512 8 8 8 8 4 4
else
echo "RAM không khớp cấu hình cụ thể. Không áp dụng tinh chỉnh."
fi
# Exit Script
echo "✔️ Done"
