#!/usr/bin/env python3
"""Load KEY=value settings from ~/.admin_script (once per process)."""

import os

_cache = None


def get(key):
	global _cache
	if _cache is None:
		_cache = {}
		path = os.path.expanduser('~/.admin_script')
		with open(path) as f:
			for line in f:
				line = line.strip()
				if not line or line.startswith('#') or '=' not in line:
					continue
				k, _, v = line.partition('=')
				_cache[k.strip()] = v.strip().strip("'\"")
	return _cache[key]
