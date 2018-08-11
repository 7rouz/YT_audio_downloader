#!/bin/bash


if [ $# -eq 0 ]
then
  echo -e "usage: ./dowload_audios_from_playlist.sh <youtube_playlist_url>\n\n\t youtube_playlist_url : should look like this https://www.youtube.com/playlist?list=your_playlist_id"

  exit 1
fi

# check if it's really a youtube playlist link
PLAYLIST_URL=$1
if [[ $PLAYLIST_URL != https://www.youtube.com/playlist?list=* ]]
then
  echo -e "[ERROR]: Please check the url.\n $PLAYLIST_URL doesn't look like a youtube playlist url !!! \n"

  exit 1
fi

# Create the folder that will contain audios
NOW=$(date -u +"%Y_%m_%dT%H_%M_%S")
Folder="downloaded_music_"$NOW
mkdir $Folder
cd $Folder

for video_link in $(wget -q "$PLAYLIST_URL" -O - | grep -e "href=\"/watch?" | awk -F"href=" '{print $2}' | awk -F";" '{print $1}' | sort | uniq | sed 's|"|https://www.youtube.com|')
do
  SONG_NAME=$(wget -q "$video_link" -O - | grep "<title>" | awk -F "<title>" '{print $2}' | awk -F "</title>" '{print $1}' | recode html..ISO-8859-1..ascii)
  echo "[INFO] Downloading "$SONG_NAME" ("$video_link")"
  
  youtube-dl --extract-audio -q -f bestaudio --audio-format wav --audio-quality 0 --output "$(echo $SONG_NAME | sed -e 's|/|_|g' -e 's| - YouTube||g').wav" "$video_link" 
done