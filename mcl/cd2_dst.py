#!/usr/bin/env python3

import sys
import subprocess
import os


dst = None
if len(sys.argv) == 2:
	dst = sys.argv[1]
else:
	dst = subprocess.getoutput('xclip -sel c -o')

if os.path.isfile(dst):
	dst = os.path.dirname(dst)
elif not os.path.isdir(dst):
	dst = '.'

print(dst)
