settings put secure long_press_timeout 300
settings put secure multi_press_timeout 300
settings put secure key_press_timeout 300
settings put secure double_tap_timeout 180
settings delete system view_scroll_friction 
settings delete system min_fling_velocity 
settings delete system max_fling_velocity 
settings delete global touch_blocking_period 
settings delete global tap_duration_threshold 
settings delete global block_untrusted_touches 
settings delete global touch_exploration_enabled 
settings delete secure pointer_speed 
settings delete system touch_slop 
settings delete system touch_pressure_scale 
if [ $? -eq 0 ]; then
echo "Khôi phục thành công"
else
echo "Thiết bị không hỗ trợ"
fi
