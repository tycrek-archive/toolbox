#!/bin/sh

BACKUP_NAME="BACKUP-$(date +%F-%I-%M-%p).7z"
SERVER_DIR="minecraft.jmoore.dev.paper"

echo Backing up Java server...

7za a -mmt -mx9 -t7z $BACKUP_NAME $SERVER_DIR
