# ====== 1. Tối ưu cảm ứng cơ bản ======
settings put secure pointer_speed 7
settings put system touch_slop 2
settings put global touch_blocking_period 35
settings put global tap_duration_threshold 20
settings put secure long_press_timeout 100
settings put secure multi_press_timeout 90
settings put secure key_press_timeout 90

# ====== 2. Tối ưu quét cảm ứng sâu ======
settings put global touch_poll_rate 240         # Tăng lấy mẫu cảm ứng (nếu hỗ trợ)
settings put secure stylus_gesture_enabled 0    # Tắt gesture stylus nếu ko dùng
settings put secure stylus_double_tap_enabled 0
settings put secure stylus_primary_button_behavior 0

# ====== 3. Cân chỉnh tốc độ - áp lực chạm (ROM tùy biến hỗ trợ) ======
settings put system touch_pressure_scale 0.35   # Giảm rung khi ngón tay lệch lực
settings put system touch_sensitivity 1         # Android tùy biến / ROM hỗ trợ

# ====== 4. Gỡ bỏ giới hạn hệ thống Android ======
settings put global block_untrusted_touches 0
settings put global touch_exploration_enabled 0
settings put secure accessibility_touch_exploration_enabled 0

# ====== 5. Giảm phản hồi dư & delay cảm ứng ======
settings put secure tap_duration_threshold 15
settings put secure double_tap_timeout 180
settings put system long_press_timeout 100

# ====== 6. Siết tracking + phản hồi cực thấp (test tùy thiết bị) ======
settings put system view_scroll_friction 0.005
settings put system min_fling_velocity 10
settings put system max_fling_velocity 8000
if [ $? -eq 0 ]; then
echo "Buff thành công"
else
echo "Thiết bị không hỗ trợ"
fi
