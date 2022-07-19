#!/bin/sh

sensors | grep "Tccd1" | tr -d '+' | awk '{print $2}'
