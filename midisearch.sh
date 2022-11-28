#!/bin/bash
download_file() {
	URLPREFIX=https://archive.org/download/midiman_melody_kit_1.0_2015-06/

	track=$(sed "${1}q;d" searchresults.txt)

	prefix="${track:0:9}.zip/${track:0:9}%2F"

	trackname=${track:10}
	echo "Downloading $trackname..."

	trackname=${trackname//[[:space:]]/%20}
	trackname=${trackname//'&'/%26}
	trackname=${trackname//"'"/%27}
	trackname=${trackname//'('/%28}
	trackname=${trackname//')'/%29}
	trackname=${trackname//','/%2C}
	trackname=${trackname//'/'/%2F}
	trackname=${trackname//'?'/%3F}

	URL="$URLPREFIX$prefix$trackname"

	wget "${URL}"
}

read -p 'Search MIDI files: ' searchitem

echo "Searching for $searchitem"...

grep -i "$searchitem" midi.txt >searchresults.txt
len=($(wc searchresults.txt))

if [ $(($len)) -gt 0 ]; then
	i=1
	while read results; do
		echo "$i: $results"
		i=$(($i + 1))
	done <searchresults.txt

	read -p 'Select Option(s): ' option

	if [[ $option == a ]] || [[ $option == all ]]; then
		echo "Warning! You are about to download $len files!"
		read -p 'Continue? (y/n) ' continue
		if [[ $continue == y ]]; then
			echo Downloading all files...
			for j in $(seq 1 $len); do
				download_file $j
			done
		fi
	else
		IFS=, read -a values <<<"$option"
		for i in "${values[@]}"; do
			if [[ $i == *-* ]]; then
				split=(${i//-/ })
				begin=$((${split[0]}))
				end=$((${split[1]}))
				for j in $(seq $begin $end); do
					download_file "$j"
				done
			else
				download_file "$i"

			fi
		done
	fi
fi
rm searchresults.txt
