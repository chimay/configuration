#!/usr/bin/env sh

echo "Content-Type: text/plain"

echo "W3m-control: SET_OPTION default_url=0"
echo "W3m-control: GOTO $(xsel -ob)"
echo "w3m-control: DELETE_PREVBUF"
echo "w3m-control: SET_OPTION default_url=1"
