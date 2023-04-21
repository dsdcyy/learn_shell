time for i in {1..10000}
do
    char=`seq -s "ljw" 100`
    ehco ${#char} &>/dev/null
done    