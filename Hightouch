settings put global sustained_performance_mode_enabled 1
# ====== 1. Cảm ứng cực nhạy và nhanh ======
settings put secure pointer_speed 7                     # Tốc độ con trỏ tối đa
settings put system touch_slop 1                        # Nhận di chuyển cực nhỏ
settings put global touch_blocking_period 0             # Không delay sau khi chạm
settings put global tap_duration_threshold 10           # Nhận chạm cực nhanh
settings put secure long_press_timeout 80               # Giảm thời gian giữ chạm
settings put secure multi_press_timeout 70
settings put secure key_press_timeout 70

# ====== 2. Tăng tần số quét & bỏ hạn chế ======
settings put global touch_poll_rate 300                 # Quét cảm ứng 300Hz (nếu hỗ trợ)
settings put global block_untrusted_touches 0
settings put global touch_exploration_enabled 0
settings put secure accessibility_touch_exploration_enabled 0

# ====== 3. Cân bằng áp lực - tốc độ ======
settings put system touch_pressure_scale 0.25           # Giảm rung lệch lực
settings put system touch_sensitivity 1                 # Độ nhạy cao nhất (ROM hỗ trợ)

# ====== 4. Siết tracking cho thao tác cực mượt ======
settings put system view_scroll_friction 0.003          # Vuốt cực mượt
settings put system min_fling_velocity 5                # Phản hồi cực thấp
settings put system max_fling_velocity 10000

# ====== 5. Tắt các yếu tố dư thừa làm trễ ======
settings put secure stylus_gesture_enabled 0
settings put secure stylus_double_tap_enabled 0
settings put secure stylus_primary_button_behavior 0
settings put system vibrate_on_touch 0
settings put system tap_ring_duration 0

# ====== 6. Siêu ép phản hồi chạm nhanh (ẩn delay) ======
settings put system double_tap_slop 50
settings put system edge_slop 0
settings put secure tap_duration_threshold 10
settings put secure double_tap_timeout 150
settings put system long_press_timeout 80

# ====== 7. Tối ưu thêm cho game ======
settings put global game_driver_all_apps 1
echo "🚀 Super Gaming Mode Activated"
if [ $? -eq 0 ]; then
echo "Buff thành công"
else
echo "Thiết bị không hỗ trợ"
fi
