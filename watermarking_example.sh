#!/bin/sh

# 先进入目标目录
for file in ./*.png
do
if [ -f "$file" ]
then
  mogrify -font /Users/virhuiaivirhuiai/Library/Fonts/Alibaba-PuHuiTi-Bold.ttf -pointsize 24 -fill black -weight bolder -gravity southeast -annotate +20+20 @"/Users/virhuiaivirhuiai/Documents/virhuiai-github/virhuiai.github.io.git/watermarking.txt" $file
fi
done