#!/usr/bin/env bash

WIDGET="media-window"

if eww active-windows 2>/dev/null | grep -q "$WIDGET"; then
  eww close "$WIDGET"
else
  eww open "$WIDGET"
fi