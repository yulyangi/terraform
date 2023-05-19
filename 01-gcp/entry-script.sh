#!/usr/bin/env bash

sudo yum apt update -y && sudo yum apt install httpd
sudo systemctl start httpd
