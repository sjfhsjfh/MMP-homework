#!/bin/bash

mkdir -p ./fonts

# STFangSong
curl -L -o "https://www.wfonts.com/download/data/2014/06/01/stfangsong/stfangsong.zip" -o ./fonts/stfangsong.zip
if [[ $? -ne 0 ]]; then
  echo "Failed to download"
  exit 1
fi
echo "Downloaded successfully."
unzip ./fonts/stfangsong.zip -d ./fonts
if [[ $? -ne 0 ]]; then
  echo "Failed to unzip"
  exit 1
fi
echo "Unzipped files successfully."

# Source Han Serif
curl -L -o "https://github.com/adobe-fonts/source-han-serif/releases/download/2.003R/09_SourceHanSerifSC.zip" -o ./fonts/sourcehanserifsc.zip
if [[ $? -ne 0 ]]; then
  echo "Failed to download"
  exit 1
fi
echo "Downloaded successfully."
unzip ./fonts/sourcehanserifsc.zip -d ./fonts
if [[ $? -ne 0 ]]; then
  echo "Failed to unzip"
  exit 1
fi
echo "Unzipped files successfully."
