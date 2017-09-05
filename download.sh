#!/bin/bash
while [ "$action" != "1" ] && [ "$action" != "2" ] && [ "$action" != "3" ]
do
  echo "1.Download as a video"
  echo "2.Download as a MP3"
  echo "3.Quit"

  echo -ne "Select action[3 to exit]:"
  read action
done

while read -r name
do
   if [[ $name == *"DONE"* ]]; then
      echo "Skip " + $name;
      echo $name >> listDone.txt;
   else
      echo "downloading... " $name 
      echo "DONE-" + $name >> listDone.txt

      case ${action} in
         "1") youtube-dl $name
              ;;
         "2") youtube-dl --extract-audio --audio-format mp3 $name
              ;;
      esac
   fi
done < /home/dev/Music/youtube/list.txt

mv /home/dev/Music/youtube/listDone.txt list.txt;
mv *.mp3 /home/dev/Music/youtube/mp3
mv *.mp4 mp4

echo "finish..."
sleep  5
