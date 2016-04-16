#!/bin/bash

# Any setup tasks beyond simply backing up and symlinking dotfiles should go here.
cd ~/dotstrap
git submodule init
git submodule update
source ~/.bashrc
