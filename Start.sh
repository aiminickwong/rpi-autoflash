#!/bin/sh
echo 'Set Environment...'
sh DESet.sh
echo 'Set Framework....'
sh Framework.sh
echo 'Flashing SD Card....'
sh SDFlash.sh
echo 'Done'
