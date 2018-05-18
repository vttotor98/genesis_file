#!/bin/bash

home=$HOME
doss="/blockchain/functions/functions.js"
~/order.sh "loadScript('"$home$doss"');checkAllBalances();"
