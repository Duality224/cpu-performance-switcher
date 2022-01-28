#!/bin/bash

#checking sudo rights
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

#checking current cpu0 scaling governor state
if [[ $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor) = powersave ]];then
#switching cpu scaling governors to performance if they are currently set to powersave
TEMP_SED=$(sed "s/powersave/performance/" /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor)
sudo echo "$TEMP_SED" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
sudo echo "$TEMP_SED" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
sudo echo "$TEMP_SED" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
sudo echo "$TEMP_SED" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
sudo echo "$TEMP_SED" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
sudo echo "$TEMP_SED" > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
sudo echo "$TEMP_SED" > /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
sudo echo "$TEMP_SED" > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
unset TEMP_SED

#checking new cpu0 scaling governor state
if [[ $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor) = performance ]];then
#changing desktop icon to performance
sed -i "s/powersave.png/performance.svg/" /path/to/cpu-switcher.desktop
#printing success message
echo 'CPU scaling governor successfully set to PERFORMANCE. Press enter to exit.'
else
#printing failure message
echo 'CPU scaling governor not correctly set. Please troubleshoot or try again.'
fi
else

#switching cpu scaling governors to powersave if they are currently set to performance
TEMP_SED=$(sed "s/performance/powersave/" /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor)
sudo echo "$TEMP_SED" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
sudo echo "$TEMP_SED" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
sudo echo "$TEMP_SED" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
sudo echo "$TEMP_SED" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
sudo echo "$TEMP_SED" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
sudo echo "$TEMP_SED" > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
sudo echo "$TEMP_SED" > /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
sudo echo "$TEMP_SED" > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
unset TEMP_SED

#checking new cpu0 scaling governor state
if [[ $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor) = powersave ]];then
#changing desktop icon to powersave
sed -i "s/performance.svg/powersave.png/" /path/to/cpu-switcher.desktop
#printing success message
echo 'CPU scaling governor successfully set to POWERSAVE. Press enter to exit.'
else
#printing failure message
echo 'CPU scaling governor not correctly set. Please troubleshoot or try again.'
fi
fi

#setting up terminal exit on enter keypress
read && exit
