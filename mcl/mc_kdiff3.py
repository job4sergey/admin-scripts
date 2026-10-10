#!/usr/bin/env python3
"""Compare active vs other pane cursor files from ~/.mc_state via DIFF_CMD."""

import os
import sys

from admin_config import get
from mc_state import active_file, load, other_file


def main():
	try:
		state = load()
	except FileNotFoundError:
		print('~/.mc_state not found; save state from mc first (menu s)', file=sys.stderr)
		return 1
	except Exception as e:
		print('invalid ~/.mc_state: %s' % e, file=sys.stderr)
		return 1
	try:
		left = active_file(state)
		right = other_file(state)
	except ValueError as e:
		print(str(e), file=sys.stderr)
		return 1
	for path in (left, right):
		if not os.path.exists(path):
			print('not found: %s' % path, file=sys.stderr)
			return 1
	diff_cmd = get('DIFF_CMD')
	os.execvp(diff_cmd, [diff_cmd, left, right])


if __name__ == '__main__':
	sys.exit(main() or 0)
