#!/bin/bash

folder_name=`date +%s`
mkdir -p $folder_name
cd $folder_name

# storing the date time to sync feeds - 2 cameras and stats from garmin
date > time.txt

# storing webcam output as 5min videos per file
ffmpeg -f avfoundation -framerate 30 -video_size 640x480 -pix_fmt uyvy422 -i "0:none" -pix_fmt yuv420p -c:v h264_videotoolbox  -b:v 2500k -flags +global_header -f segment -segment_time 300 -segment_format_options movflags=+faststart -reset_timestamps 1 test%d.mp4

# when done, concatenate the videos
touch list.txt
for f in `ls -rt *.mp4`; do
	echo "file '${f}'" >> list.txt
done
ffmpeg -f concat -i list.txt -c copy final.mp4
