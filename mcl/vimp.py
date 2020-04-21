#!/usr/bin/env python3
import os, sys

if len(sys.argv) < 2:
	os.system("vim /dev/null 2>&1")
	
	sys.exit(0)

line = sys.argv[1]
if line:
	parts = line.split(':')
	sz = len(parts)
	if sz > 1:
		os.system("vim +%s %s > /dev/null 2>&1" % parts[1], parts[1])
	elif sz == 1:
		os.system("vim %s > /dev/null 2>&1" % parts[0])
