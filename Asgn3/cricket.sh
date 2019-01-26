#!/bin/bash
echo "Please Enter the name of the team you wish to follow!";
# read team;
team="west indies";
s1=HELLO;
s2=WORLD;
while true; do
	 # wget  http://static.cricinfo.com/rss/livescores.xml >/dev/null 2>&1;
	 cat  livescores.xml| grep -iE "$team [0-9]+.*</title>|$team</title>" > title;
	 cat title | grep -oE "[0-9]+/[0-9]+" > score;
	 livescore="$(grep -oE "[^<>]*[0-9]+/[^<>]*" title)";
	 s1new=$(sed -n '1p' score);
	 s2new=$(sed -n '2p' score);
	 if [[ "$s2new" != "$s2" || "$s1new" != "$s1" ]]; then
  		echo "$livescore";
  		echo "HELLO"
  		s1=$s1new;
		s2=$s2new;
else
	s1=$s1new;
	s2=$s2new;
fi
	rm -rf   score title;
done
