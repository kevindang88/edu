#!/bin/bash
#

if [ -O /etc/passwd ]; then
  echo "you are the owner of /etc/passwd."
else
  echo "you are NOT the owner of /etc/passwd."
fi

