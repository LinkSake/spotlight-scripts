#!/bin/bash

# USAGE:
#   pomodoro.sh [-f <focus time>] [-b <break time>] [-l <long break>] [-r <rounds>] [-c <cycles>] [-F <focus script>] [-B <break script>] [-L <long break script>] [-P <pause script>] [-R <resume script>]

# OPTIONS:
#   -f: Focus time in seconds (default is 1500)
#   -b: Break time in seconds (default is 300)
#   -l: Long break time in seconds (default is 1200)
#   -r: Number of sessions per cycle (default is 4)
#   -c: Number of cycles (default is 1)
#   -F: Command to run when focus time starts
#   -B: Command to run when short break starts
#   -L: Command to run when long break starts
#   -P: Command to run when paused
#   -R: Command to run when resumed
#   -h: Display this help message

# EXAMPLE USAGE:
#   To run the timer with default values:
#     ./pomodoro.sh
#   To run the timer with custom values:
#     ./pomodoro.sh -f 1800 -b 360 -l 2400 -r 5 -c 2 -F "say 'Focus Time!'" -B "say 'Break Time!'" -L "say 'Long Break Time!'" -P "say 'Paused!'" -R "say 'Resumed!'"


# DEFAULT VALUES
NAME="Pomodoro"

FOCUS=1500
BREAK=300
LONG_BREAK=1200
ROUNDS=4
CYCLES=1

FOCUS_SCRIPT=""
BREAK_SCRIPT=""
LBREAK_SCRIPT=""
PAUSE_SCRIPT=""
RESUME_SCRIPT=""

HELP="Pomodoro Timer
Options:
\t-f <focus time in sec>
\t-b <break time in sec>
\t-l <long break in sec>
\t-r <number of sessions before long break>
\t-c <number of cycles>
\t-F <command to run when focus time starts>
\t-B <command to run when short break starts>
\t-L <command to run when long break starts>
\t-P <command to run when paused>
\t-R <command to run when resumed>"

# PARSE OPTIONS
while getopts "f:b:r:c:l:F:B:L:P:R:h" opt; do
    case $opt in
        f)
            FOCUS=$OPTARG ;;
        b)
            BREAK=$OPTARG ;;
        r)
            ROUNDS=$OPTARG ;;
        c)
            CYCLES=$OPTARG ;;
        l)
            LONG_BREAK=$OPTARG ;;
        F)
            FOCUS_SCRIPT=$OPTARG ;;
        B)
            BREAK_SCRIPT=$OPTARG ;;
        L)
            LBREAK_SCRIPT=$OPTARG ;;
        P)
            PAUSE_SCRIPT=$OPTARG ;;
        R)
            RESUME_SCRIPT=$OPTARG ;;
        h|\?)
            printf "$HELP\n"
            exit 1 ;;
    esac
done

formatTime() {
    if [[ $2 -eq 1 ]]; then
        printf '%02d' $(expr $1)
    else
        printf '%02d' $(expr $1 - 1)
    fi
}

timer() {
    MIN=$(expr $1 / 60)
    SEC=$(expr $1 - $MIN \* 60)
    for (( min=$MIN; min>=0; min-- ))
    do
        for (( sec=$SEC; sec>0; sec-- ))
        do
            BODY="Time Remaining: $(formatTime $min 1):$(formatTime $sec) seconds"
            osascript -e "display notification \"$BODY\" with title \"$2\" subtitle \"$BODY\" sound name \"default\""
            sleep 1
        done
        SEC=60
    done
}

start() {
    osascript -e "display notification \"Pomodoro Session Started!\" with title \"$NAME\" subtitle \"Cycle $1 • Session $2 • Focus Time!\" sound name \"default\""
    sh -c "$FOCUS_SCRIPT"
    timer $FOCUS "Cycle $1 • Session $2 • Focus Time!"

    if [[ $3 -eq 1 ]]; then
        osascript -e "display notification \"LONG BREAK TIME!\" with title \"$NAME\" subtitle \"Cycle $1 • Long Break!\" sound name \"default\""
        sh -c "$LBREAK_SCRIPT"
        timer $LONG_BREAK "Long Break!"

    elif [[ $3 -eq 2 ]]; then
        return;

    else
        osascript -e "display notification \"BREAK TIME!\" with title \"$NAME\" subtitle \"Cycle $1 • Short Break!\" sound name \"default\""
        sh -c "$BREAK_SCRIPT"
        timer $
    fi
}

quit() {
	sh -c "$EXIT_SCRIPT"
	exit 0
}

trap quit SIGINT

for (( i=0; i<$CYCLES; i++ ))
do
	for (( j=1; j<=$ROUNDS; j++ ))
	do
		k=$(expr $i + 1)
		if [[ j -eq $ROUNDS ]] && [[ i -ne $(expr $CYCLES - 1) ]]; then
			start $k $j 1
		elif [[ j -eq $ROUNDS ]] && [[ i -eq $(expr $CYCLES - 1) ]]; then
			start $k $j 2
		else
			start $k $j
		fi
	done
done
quit