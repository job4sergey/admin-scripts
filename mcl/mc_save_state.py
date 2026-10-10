#!/usr/bin/env python3
"""Write Midnight Commander panel macros to ~/.mc_state as JSON.

Intended mc user-menu invocation (see dotfiles/mc_menu):

  set --
  for i in %u; do set -- "$@" -u "$i"; done
  for i in %U; do set -- "$@" -U "$i"; done
  "$SCRIPTS_DIR/mc_save_state.py" -s %s -S %S -d %d -D %D "$@"

JSON keys:
  s  file under cursor, active pane   (string)
  S  file under cursor, other pane    (string)
  d  directory, active pane           (string)
  D  directory, other pane            (string)
  u  tagged files, active pane        (array)
  U  tagged files, other pane         (array)
"""

import argparse
import json
import os
import sys


def main(argv):
	p = argparse.ArgumentParser(description='Save mc panel state to ~/.mc_state')
	p.add_argument('-s', default='', help='active pane file under cursor')
	p.add_argument('-S', default='', help='other pane file under cursor')
	p.add_argument('-d', default='', help='active pane directory')
	p.add_argument('-D', default='', help='other pane directory')
	p.add_argument('-u', action='append', default=[], help='active pane tagged file (repeatable)')
	p.add_argument('-U', action='append', default=[], help='other pane tagged file (repeatable)')
	args = p.parse_args(argv)

	state = {
		's': args.s,
		'S': args.S,
		'd': args.d,
		'D': args.D,
		'u': args.u,
		'U': args.U,
	}
	path = os.path.expanduser('~/.mc_state')
	with open(path, 'w', encoding='utf-8') as f:
		json.dump(state, f, indent=2, ensure_ascii=False)
		f.write('\n')
	return 0


if __name__ == '__main__':
	sys.exit(main(sys.argv[1:]))
