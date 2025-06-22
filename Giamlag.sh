chmod 777 "$0"
ulimit -s unlimited
pid_op() {
for pid in $(ps | awk '$1=="shell" {print $2}'); do
  ionice -c 3 -p "$pid"
  iorenice "$pid" idle 7
  renice -n 19 -p "$pid"
  taskset -ap 80 "$pid"
done >/dev/null 2>&1 
}
PowerSuper() {
cmd power set-adaptive-power-saver-enabled false >/dev/null 2>&1
cmd power set-fixed-performance-mode-enabled true >/dev/null 2>&1
cmd activity idle-maintenance >/dev/null 2>&1
cmd blob_store clear-all-blobs
cmd blob_store clear-all-sessions
cmd blob_store idle-maintenance
cmd activity clear-exit-info
cmd activity clear-watch-heap all
cmd activity memory-factor set CRITICAL
cmd activity idle-maintenance
cmd activity set-deterministic-uid-idle true
for a in $(cmd package list packages -s|grep -E 'audio|systemui|:android$'|cut -f2 -d:);do cmd activity idle-maintenance "$a";done >/dev/null 2>&1 &
am kill-all
cmd activity kill-all
for pid in $(ps | awk '$1=="u0_a" {print $2}'); do
kill -9 "$pid"
done
sm idle-maint abort
dumpsys deviceidle whitelist -com.google.android.gms
sync
# Giảm tần suất ghi log hệ thống (chủ yếu trên thiết bị tùy biến)
settings put global dropbox_max_files 0
settings put global dropbox_age_seconds 0
settings put global dropbox_quota_kb 0
settings put global dropbox_reserve_percent 0
pm trim-caches 512M
# Lấy giá trị dalvik.vm.heapgrowthlimit
heap_limit=$(getprop dalvik.vm.heapgrowthlimit)
# Đặt logcat với giá trị heapgrowthlimit làm kích thước tối đa
logcat -G "$heap_limit"
pkill -f logcat
cmd thermalservice override-status 0
setprop debug.overlayui.enable 0
setprop debug.performance.tuning 0
setprop debug.hwui.profile 0
setprop debug.egl.hw 0
setprop debug.egl.trace 0
setprop debug.gles.trace 0
setprop debug.egl.profiler 0
setprop debug.hwui.render_dirty_regions false
setprop debug.hwui.force_msaa 0
setprop debug.hwui.force_fxaa 0
setprop debug.hwui.force_smaa 0
setprop debug.hwui.force_msaa 0
setprop debug.hwui.force_txaa 0
setprop debug.hwui.force_csaa 0
setprop debug.hwui.force_dlss 0
setprop debug.egl.force_msaa 0
setprop debug.egl.force_fxaa 0
setprop debug.egl.force_smaa 0
setprop debug.egl.force_msaa 0
setprop debug.egl.force_txaa 0
setprop debug.egl.force_csaa 0
setprop debug.egl.force_dlss 0
setprop debug.egl.force_dmsaa 0
# Thực thi các lệnh
setprop debug.rs.reduce 1
setprop debug.rs.reduce-split-accum 1
setprop debug.rs.profile 0
setprop debug.rs.script 0
setprop debug.rs.shader 0
setprop debug.rs.shader.attributes 0
setprop debug.rs.shader.uniforms 0
setprop debug.rs.visual 0
setprop debug.rs.debug 0
setprop debug.egl.frameskip 0
setprop debug.overlayui.enable 0
setprop debug.rs.default-CPU-driver 0
setprop debug.rs.rsov 0
setprop debug.egl.callstack false
setprop debug.egl.blobcache.multifile true
setprop debug.egl.blobcache.multifile_limit -1
setprop debug.egl.recordable.rgba8888 1
setprop debug.egl.finish false
setprop debug.sf.enable_egl_image_tracker false
setprop debug.sf.vrr_timeout_hint_enabled true
setprop debug.sf.enable_legacy_frontend true
setprop debug.sf.trace_hint_sessions false
setprop debug.sf.enable_cached_set_render_scheduling true
setprop debug.sf.enable_adpf_cpu_hint true
setprop debug.sf.frame_rate_category_mrr true
setprop debug.sf.cache_source_crop_only_moved true
setprop debug.sf.multithreaded_present true
setprop debug.sf.enable_vrr_config true
setprop debug.stagefright.fps false
setprop debug.stagefright.rtp false
setprop debug.art.monitor.app false
setprop debug.media.c2.large.audio.frame true
setprop debug.adpf.use_report_actual_duration true
setprop debug.hwc.flattenning_enabled false
setprop debug.hwc.normalize_hint_session_durations false
setprop debug.hwc.trace_hint_sessions false
setprop debug.incremental.enable_read_timeouts_after_install true
setprop debug.force_low_ram false
setprop debug.angle.validation false
setprop debug.c2.use_dmabufheaps 1
setprop security.perf_harden 1
setprop security.perf_harden 0
setprop debug.perf_cpu_time_max_percent 30
}
pid_op
PowerSuper >/dev/null 2>&1&
echo "❤️ Đã Tối Ưu"
