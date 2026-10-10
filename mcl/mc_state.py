#!/usr/bin/env python3
"""Load ~/.mc_state and resolve pane file paths."""

import json
import os


STATE_PATH = os.path.expanduser('~/.mc_state')


def load(path=STATE_PATH):
	with open(path, encoding='utf-8') as f:
		return json.load(f)


def absolute_path(name, directory):
	name = (name or '').strip()
	directory = (directory or '').strip()
	if not name:
		raise ValueError('empty file name')
	if os.path.isabs(name):
		path = name
	elif directory:
		path = os.path.join(directory, name)
	else:
		path = name
	dirname = os.path.dirname(path)
	base = os.path.basename(path)
	if dirname and os.path.isdir(dirname):
		dirname = os.path.realpath(dirname)
	elif dirname:
		dirname = os.path.normpath(dirname)
	return os.path.join(dirname, base) if dirname else base


def active_file(state):
	return absolute_path(state.get('s'), state.get('d'))


def other_file(state):
	return absolute_path(state.get('S'), state.get('D'))
