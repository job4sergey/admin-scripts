#!/usr/bin/env python3

import sys, os

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from admin_config import get

stdin_txt = ''.join(sys.stdin.readlines())

import tempfile
with tempfile.NamedTemporaryFile() as tmp:
	tmp.write(str.encode(stdin_txt))
	tmp.flush()
	os.system(get('CLIPBOARD_COPY') % tmp.name)
