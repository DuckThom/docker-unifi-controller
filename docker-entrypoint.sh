#!/bin/bash

set -e

# Start mongo and unifi
service unifi start

exec tail -f /usr/lib/unifi/logs/*
