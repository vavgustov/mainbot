# Swarm
All bots united in the swarm.

> **Note:** this application developed for personal needs.

![image](https://user-images.githubusercontent.com/312873/39545547-2eb59d6e-4e5a-11e8-8d3a-7672fa7dd780.png)

## Table of Contents
- [Bots](#bots)
- [Launch agent](#launch-agent)

## Bots
* Foodbot: food discount reports
* Octobot: unread Github trends reports

## Launch agent
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Label</key>
   	<string>com.vladimir.swarm</string>   	
   	<key>RunAtLoad</key>
   	<true/>
   	<key>ProgramArguments</key>
   	<array>
   		<string>/usr/bin/curl</string>   			
   		<string>http://swarm.local:8080/crawler</string>
   	</array>   	
</dict>
</plist>
```
