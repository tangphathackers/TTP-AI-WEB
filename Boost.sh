setprop security.perf_harden 1
setprop security.perf_harden 0
setprop debug.perf_cpu_time_max_percent 80
setprop debug.perf_event_max_sample_rate -1
setprop debug.perf_event_mlock_kb 16384
setprop debug.perf_event_sample_period_max -1
setprop debug.sf.hw 1
setprop debug.sf.swapinterval 1
settings put global low_power 0
settings put global activity_manager_constants max_cached_processes=4096,CUR_MAX_CACHED_PROCESSES=2048,CUR_MAX_EMPTY_PROCESSES=2048,CUR_TRIM_EMPTY_PROCESSES=2048,CUR_TRIM_CACHED_PROCESSES=2048,MEM_CONSTANTS_SUPER_SIZE=true,cpu_usage_scaling_factor=2,MULTI_THREAD_CPU=true,power_check_max_cpu_1=10,power_check_max_cpu_2=10,power_check_max_cpu_3=10,power_check_max_cpu_4=10,power_check_max_gpu=70,max_empty_time_millis=600000,max_phantom_processes=4096
if [ $? -eq 0 ]; then
echo "😊 Success CPU Booster V2"
else
echo "😸 Device Not Support Booster V2"
fi
