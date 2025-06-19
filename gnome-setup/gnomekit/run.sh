#!/bin/bash

print_logo(){
    cat << "EOF"
                          _   _ _   
  __ _ _ _  ___ _ __  ___| |_(_) |_ 
 / _` | ' \/ _ \ '  \/ -_) / / |  _|
 \__, |_||_\___/_|_|_\___|_\_\_|\__| 
 |___/                              
EOF
}

#clear screen
clear
print_logo

#exit on error
set -e

