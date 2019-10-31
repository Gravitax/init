arp -a | awk -F '(' '{print $2}' | awk -F ')' '{print $1}'
#arp -a | awk -F '[()]' '{print $2}'
#ipconfig getifaddr en0
