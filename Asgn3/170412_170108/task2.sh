#!/bin/bash
echo "Please Enter the name of the team you wish to follow!";
read team;
s1=HELLO;
while true; do
	 wget  http://static.cricinfo.com/rss/livescores.xml >/dev/null 2>&1;
	 grep -iE "$team [0-9]+.*</title>|$team</title>|<title>$team v" livescores.xml >score;
	 
	 livescore="$(cut -d ">" -f 2 score| cut -d "<" -f 1)"
	 s1new=$livescore;
	 if [[ "$s1new" != "$s1" ]]; then

  		notify-send "$livescore";
  		s1=$s1new;
else
	s1=$s1new;
fi
	rm -rf  livescores.xml score;
sleep 10;
done
