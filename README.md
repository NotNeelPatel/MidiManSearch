# MidiMan Search

### By Neel Patel

Search and download MIDI files from [MIDIMAN's Melody Kit](https://archive.org/details/midiman_melody_kit_1.0_2015-06) in a BASH terminal.

### Search For Files

Search individual keywords to get a list of files

### Select Option(s)

Select the (numbered) options. Examples below:

#### Selecting Option 4

```
Select Option(s): 4
```

#### Selecting multiple options

```
Select Option(s): 3,6,7
```

#### Selecting multiple consecutive options (4,5,6,7)

```
Select Option(s): 4-7
```

#### Selecting multiple options, consecutive and non-consecutive

```
Select Option(s): 3,4-7,9,12
```

#### Selecting all

```
Select Option(s): all
```

## Usage

#### Clone Repository

```
git clone https://github.com/notneelpatel/MidiManSearch && cd MidiManSearch
```

#### Make file executable

```
chmod +x midisearch.sh
```

#### Execute program

```
./midimansearch.sh
```

Midi files will download in the repo directory. The file download_midi_txt.sh is used to make the midi.txt file.
