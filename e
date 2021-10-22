#!/bin/bash



metaexploit_Anime(){
	x=albin\ joseph\ c.r
	#x=hello\ world
	for((;n<50;)){
	echo -en "\r${x:0:n}"`tr a-z A-Z<<<"${x:n:1}"`"${x:n+++1}"
	sleep 0.3
	}
}

#while :
#do
#fn
#done


linear()
{
count=0
total=34
pstr="[=======================================================================]"

while [ $count -lt $total ]; do
  sleep 0.3 # this is work
  count=$(( $count + 1 ))
  pd=$(( $count * 73 / $total ))
  printf "\r%3d.%1d%% %.${pd}s" $(( $count * 100 / $total )) $(( ($count * 1000 / $total) % 10 )) $pstr
done
}

spinner()
{
    local pid=$!
    local delay=0.75
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# #!/bin/bash
# (just replace sleep 20 with whatever command you want to indicate is running)
printer(){
sleep 20 & PID=$! #simulate a long process

echo "THIS MAY TAKE A WHILE, PLEASE BE PATIENT WHILE ______ IS RUNNING..."
printf "["
# While process is running...
while kill -0 $PID 2> /dev/null; do 
    printf  "▓"
    sleep 1
done
printf "] done!"
}

linear
