#!/bin/bash

if [ "$#" = "2" ]; then
    echo kod letiska je "$2"
    let="$2"
    echo kod letiska je "$let"
    M=$(echo "$1" | cut -c1-2)
    D=$(echo "$1" | cut -c4-5)
    Y=$(echo "$1" | cut -c7-10)
    datum=""$M"/"$D"/"$Y""
    echo "$datum"
    START=$(echo $(date -d "$datum" +'%s'))
    echo zaciatok dna v s "$START"
    END=$(echo "$START"+60*60*24 | bc )
    echo koniec dna v s "$END"
    curl -s 'https://aviationweather.gov/adds/dataserver_current/httpparam?dataSource=metars&requestType=retrieve&format=csv&stationString='"$let"'&startTime='"$START"'&endTime='"$END"'' | grep "$let"
else 
    echo nespravny pocet argumentov
fi
