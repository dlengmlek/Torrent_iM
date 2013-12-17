#!/bin/sh

echo "$TR_TORRENT_NAME" |
sed  > ~/Documents/Torrent/.TRT.txt



osascript <<-END
set a to (path to Documents folder as  Unicode text) & "Torrent:"
set theTPath to (a as Unicode text) & ".TRT.txt"
set toTsend to read file theTPath as «class utf8»
set theCPath to (a as Unicode text) & "iCloud.txt"
set toCsend to read file theCPath as «class utf8»
set theMPath to (a as Unicode text) & "SendM.txt"
set toMsend to read file theMPath as «class utf8»
set thePPath to (a as Unicode text) & "Phone.txt"
set addphone to read file thePPath as «class utf8»

repeat with i in every paragraph of addphone
set phone to contents of i
tell application "Messages"
send toTsend & toMsend to buddy phone of service toCsend
end tell
end repeat
END


rm ~/.TRT.txt
