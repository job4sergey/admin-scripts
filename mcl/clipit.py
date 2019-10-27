#!/usr/bin/env python3

import sys, os

stdin_txt = ''.join(sys.stdin.readlines())

import tempfile
with tempfile.NamedTemporaryFile() as tmp:
	tmp.write(str.encode(stdin_txt))
	tmp.flush()
	os.system("cat %s | xclip -sel c" % tmp.name)