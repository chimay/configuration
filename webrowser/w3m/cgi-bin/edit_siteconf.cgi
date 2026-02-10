#!/usr/bin/env sh

echo "w3m-control: BACK"
echo "w3m-control: LOAD $W3M_DIR/siteconf"
echo "w3m-control: EDIT"
echo "w3m-control: BACK"
echo "w3m-control: REINIT"
echo "w3m-control: MESSAGE siteconf reloaded"
