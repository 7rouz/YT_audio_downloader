# YT Playlist Audio Downloader
## Requirements
This script uses youtube-dl command line to download audios from music videos. I used pip to instal it :
```
$ virtualenv .youtube-dl-env
$ source .youtube-dl-env/bin/activate
$ pip install --upgrade youtube-dl
```
you will need to activate the virtual env "youtube-dl-env" each time you will need to use youtube-dl. 

There is an other way to install youtube-dl (from the [readme](https://github.com/rg3/youtube-dl/blob/master/README.md) of youtube-dl):

To install it right away for all UNIX users (Linux, macOS, etc.), type:

```
$ sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
$ sudo chmod a+rx /usr/local/bin/youtube-dl
```

If you do not have curl, you can alternatively use a recent wget:
```
$ sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
$ sudo chmod a+rx /usr/local/bin/youtube-dl
```

you can go and have a look on the youtube-dl [here](https://github.com/rg3/youtube-dl) for further information.

you will also need to install ffmpeg which is used by youtube-dl:
```
$ sudo apt-get install ffmpeg
```

Finally, you will need to install record (command line that we will use it to convert html characters to ascii)

```
$ sudo apt-get install recode
```

## How to use 
Please have a look first at the requirements because you will need to install some dependencies 

if you installed youtube-dl in a virtual-env don't forget to activate it like this ``` source /path/to/virtual-env```

Now all you have to do is get a playlist url and run this command:
```
$ ./download_audios_from_playlist.sh https://www.youtube.com/playlist?list=your_playlist_id
```
## Example

```
$ source .youtube-dl-env/bin/activate
$ ./download_audios_from_playlist.sh https://www.youtube.com/playlist?list=PLeDakahyfrO9K852phKZ0DCT_VxlhfRhl
```
