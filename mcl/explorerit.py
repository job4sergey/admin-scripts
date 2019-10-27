#!/usr/bin/env python3
import os, sys

for line in sys.stdin:
	os.system("xdg-open %s > /dev/null 2>&1" % line)