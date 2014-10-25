#!/bin/bash
tool-stream extractProperty $1 | grep -v 0|uniq -c| awk '{print $2 " "$1}' |  bar_chart.py --sort-keys --agg-values | sort -n
