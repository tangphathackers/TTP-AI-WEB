for c in $(cmd device_config list|cut -f1 -d=)
do cmd device_config delete "${c%/*}" "${c#*/}"&done
