#!/usr/bin/env bash

if [[ "$(hyprctl monitors)" =~ "\sDP-[0-9]+" ]]; then
  if [[ $1 == "open" ]]; then
    hyprctl keyword monitor "eDP-1,enable"
  else
    hyprctl keyword monitor "eDP-1,disable"
  fi
fi
