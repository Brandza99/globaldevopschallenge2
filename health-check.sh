#!/bin/bash

URL="$1"
PORT="$2"
TIME=$(date +"%H:%M:%S")
DATE=$(date +"%d.%m.%Y")


if [ -z "$URL" ]
then
  echo "ERROR: You must be provide URL"
  echo "Usage: ./devops-check.sh https://example.com 9050"
  exit 1
fi

if [ -z "$PORT" ]
then
  echo "ERROR: You must be provide PORT"
  echo "Usage: ./devops-check.sh https://example.com 9050"
  exit 1
fi

echo "Starting DevOps health check"
echo "----------------------------"

echo "Checking internet connection"

if ping -c 3 8.8.8.8 > /dev/null 2>&1
then
  echo "Internet is Ok"
else
  echo "Internet: Problem"
fi

echo "Checking DNS..."

if  getent hosts google.com > /dev/null 2>&1
then
  echo "DNS: OK"
else
  echo "DNS: PROBLEM"
fi

echo "Checking URL: $URL"

if curl -s -f -I "$URL" > /dev/null 2>&1
then
  echo "URL: OK"
else
  echo "URL: PROBLEM"
fi 

echo "Checking local port: $PORT"

if ss -tuln | grep  "$PORT" > /dev/null 2>&1
then
  echo "Port $PORT: LISTENING"
else
  echo "Port $PORT: NOT LISTENING"
fi

echo "======================================="
echo "DevOps health check finished"
echo "===$(date '+%H:%M:%S - %d.%m.%Y')=========="
