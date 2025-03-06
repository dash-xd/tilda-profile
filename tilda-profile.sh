#!/bin/bash

config_dir="$HOME/.config/tilda/"

if [ "$1" == "--save" ]; then
    if [ -z "$2" ]; then
        echo "Please provide a directory name after --save"
        exit 1
    fi

    dir_name="$2"
    profile_dir="$config_dir"profiles/"$dir_name"

    if [ ! -d "$profile_dir" ]; then
        mkdir -p "$profile_dir"
    fi

    if [ -d "$profile_dir" ]; then
        cp "$config_dir"config_* "$profile_dir"
        echo "Files copied to $profile_dir"
    else
        echo "Directory $profile_dir does not exist or could not be created."
        exit 1
    fi

elif [ "$1" == "--load" ]; then
    if [ -z "$2" ]; then
        echo "Please provide a directory name after --load"
        exit 1
    fi

    dir_name="$2"
    profile_dir="$config_dir"profiles/"$dir_name"

    if [ ! -d "$profile_dir" ]; then
        echo "tilda profile was not found"
        exit 1
    fi

    # Find and kill running instances of tilda from /usr/bin/tilda
    pids=$(pgrep -f "/usr/bin/tilda")
    if [ -n "$pids" ]; then
        echo "Terminating running instances of tilda..."
        echo "$pids" | while IFS= read -r pid; do
            kill "$pid"
        done
    fi

    sleep 1 # necessary to kill tilda fully before swapping config files
    rm "$config_dir"config_*
    cp "$profile_dir"/config_* "$config_dir"
    echo "Files copied from $profile_dir to $config_dir"

else
    echo "Invalid flag. Please use --save or --load"
    exit 1
fi
