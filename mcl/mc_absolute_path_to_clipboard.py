#!/usr/bin/env python3
"""Read ~/.mc_state and print absolute path of active-pane cursor file."""

import sys

from mc_state import active_file, load


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
		sys.stdout.write(active_file(state))
	except ValueError as e:
		print(str(e), file=sys.stderr)
		return 1
	return 0


if __name__ == '__main__':
	sys.exit(main())
