#!/bin/bash
if mysqladmin ping -h 127.0.0.1 --silent; then
    exit 0
else
    exit 1
fi
