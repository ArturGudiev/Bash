#!/bin/bash
exec 1>./logs  2>.errors
# google-chrome $1 &
chromium-browser $1 &
