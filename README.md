# Swarm
All bots united in the swarm.

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
