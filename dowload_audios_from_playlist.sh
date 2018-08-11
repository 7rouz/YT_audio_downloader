#!/bin/bash

PLAYLIST_URL=$1
####################
# Get videos urls  #
####################

NOW=$(date -u +"%Y_%m_%dT%H_%M_%S")
Folder="dowloaded_music_"$NOW
mkdir $Folder
cd $Folder

for video_link in $(wget -q "$PLAYLIST_URL" -O - | grep -e "href=\"/watch?" | awk -F"href=" '{print $2}' | awk -F";" '{print $1}' | sort | uniq | sed 's|"|https://www.youtube.com|')
do
  SONG_NAME=$(wget -q "$video_link" -O - | grep "<title>" | awk -F "<title>" '{print $2}' | awk -F "</title>" '{print $1}' | recode html..ascii)
  echo "[Debug] Downloading "$SONG_NAME" -----------> "$video_link
  
  youtube-dl --extract-audio -f bestaudio --audio-format wav --audio-quality 0 --output "$(echo $SONG_NAME | sed 's| |_|g')".wav "$video_link" 
done

