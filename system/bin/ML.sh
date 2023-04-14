#!/system/bin/sh

echo •Changing SELinux to Permissive•
sleep 1
setenforce 0
echo •DONE. SELinux Status is Permissive•
sleep 1
echo •Changing Permissions•
sleep 1
chmod 777 /data/data/com.mobile.legends/shared_prefs/com.mobile.legends.v2.playerprefs.xml
echo •DONE.•
sleep 1

local installed=$(pm list package | grep com.mobile.legends)
    if [ ! -z $installed ]; then
        local playerprefs=/data/data/com.mobile.legends/shared_prefs/com.mobile.legends.v2.playerprefs.xml
        if [ -f $playerprefs ]; then
            if grep -q "HighFpsModeSee" $playerprefs; then
                sed -i -r 's/"HighFpsModeSee" value=".+"/"HighFpsModeSee" value="4"/' $playerprefs
            else
                local fps1='<int name="HighFpsModeSee" value="4" />'
                sed -i "3i$fps1" $playerprefs
            fi
            if grep -q "HighFpsMode_new" $playerprefs; then
                sed -i -r 's/"HighFpsMode_new" value=".+"/"HighFpsMode_new" value="4"/' $playerprefs
            else
                local fps2='<int name="HighFpsMode_new" value="4" />'
                sed -i "3i$fps2" $playerprefs
            fi
            if grep -q "PerformanceDevice_EnableQuality_new" $playerprefs; then
                sed -i -r 's/"PerformanceDevice_EnableQuality_new" value=".+"/"PerformanceDevice_EnableQuality_new" value="4"/' $playerprefs
            else
                local quality1='<int name="PerformanceDevice_EnableQuality_new" value="4" />'
                sed -i "3i$quality1" $playerprefs
            fi
            if grep -q "PerformanceDevice_BestQuality" $playerprefs; then
                sed -i -r 's/"PerformanceDevice_BestQuality" value=".+"/"PerformanceDevice_BestQuality" value="4"/' $playerprefs
            else
                local quality2='<int name="PerformanceDevice_BestQuality" value="4" />'
                sed -i "3i$quality2" $playerprefs
            fi
            if grep -q "PerformanceDevice_BestQuality_new" $playerprefs; then
                sed -i -r 's/"PerformanceDevice_BestQuality_new" value=".+"/"PerformanceDevice_BestQuality_new" value="4"/' $playerprefs
            else
                local quality3='<int name="PerformanceDevice_BestQuality_new" value="4" />'
                sed -i "3i$quality3" $playerprefs
            fi
            if grep -q "PerformanceTest" $playerprefs; then
                sed -i -r 's/"DeviceScore">.+</"DeviceScore">115_0</' $playerprefs
            else
                local score1='<int name="PerformanceTest" value="1" />'
                sed -i "3i$score1" $playerprefs
                local score2='<string name="DeviceScore">115_0</string>'
                sed -i "3i$score2" $playerprefs
            fi
        fi
    fi

clear
echo •ALL DONE,!•
sleep 1
echo •Lets Play MLBB•
