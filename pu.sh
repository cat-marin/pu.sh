#!/usr/bin/env bash
API_TOKEN=""
USER_TOKEN=""

push() {
	curl -s -F "token=$API_TOKEN" \
	-F "user=$USER_TOKEN" \
	-F "title=$TITLE" \
	-F "message=$MESSAGE" https://api.pushover.net/1/messages.json
}

while getopts "t:m:" options; do
	case "${options}" in
		t)
			TITLE="${OPTARG}"
		;;
		m)
			MESSAGE="${OPTARG}"
		;;	
	esac
done

if [[ "$TITLE" == "" ]]; then
	TITLE=$(hostname)
fi
if [[ "$MESSAGE" == "" ]]; then
	MESSAGE="empty message"
fi
push
