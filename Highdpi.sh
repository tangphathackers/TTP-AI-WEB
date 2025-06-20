sleep 2
cmd window size reset
cmd window density reset
# Tăng kích thước màn hình lên 1.0667 lần
scale=1.0667
orig_size=$(cmd window size | grep Physical | awk '{print $3}')
w=$(echo "$orig_size" | cut -d'x' -f1)
h=$(echo "$orig_size" | cut -d'x' -f2)

new_w=$(echo "$w * $scale" | bc | cut -d. -f1)
new_h=$(echo "$h * $scale" | bc | cut -d. -f1)
wm size ${new_w}x${new_h}

# Tính DPI mới tương ứng
orig_dpi=$(wm density | awk '{print $NF}')
new_dpi=$(echo "$orig_dpi / $scale" | bc | cut -d. -f1)
wm density $new_dpi
if [ $? -eq 0 ]; then
echo "Buff thành công"
else
echo "Thiết bị không hỗ trợ"
fi
