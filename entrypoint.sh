#!/bin/bash
htpasswd -bc /etc/nginx/htpasswd "$USERNAME" "$PASSWORD"
echo Done.
