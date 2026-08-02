#!/usr/bin/env python3

import sys
import subprocess
import os

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from admin_config import get


dst = None
if len(sys.argv) == 2:
	dst = sys.argv[1]
else:
	dst = subprocess.getoutput(get('CLIPBOARD_PASTE'))

if os.path.isfile(dst):
	dst = os.path.dirname(dst)
elif not os.path.isdir(dst):
	dst = '.'

print(dst)
