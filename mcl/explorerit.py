#!/usr/bin/env python3
import os, sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from admin_config import get

open_cmd = get('OPEN_CMD')
for line in sys.stdin:
	os.system(open_cmd % line)
