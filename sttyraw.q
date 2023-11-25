#!/usr/bin/env q
orig:first system"stty -g"
system "stty raw"
sh:{1@x;x}
while["q"<>c:sh system["dd bs=1 count=1 2>/dev/null"][0][0]; ]
system "stty ",orig
.z.exit:{system "stty ",x}orig
exit 0
