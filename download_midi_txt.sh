#!/bin/bash
echo Downloading MIDI text files from archive.org...
for i in {0..9}; do
    wget https://ia801403.us.archive.org/24/items/midiman_melody_kit_1.0_2015-06/MIDIMAN_${i}.zip.txt
done

for j in {A..Z}; do
    wget https://ia801403.us.archive.org/24/items/midiman_melody_kit_1.0_2015-06/MIDIMAN_${j}.zip.txt
done

echo Combining files into one txt file...
grep -hro 'MIDIMAN_.*' MIDIMAN_*.zip.txt >midi.txt

echo Removing excess files...
rm MIDIMAN_*.zip.txt

echo Done!
