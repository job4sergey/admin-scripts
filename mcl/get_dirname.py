#!/usr/bin/env python3

import os
import sys

if __name__ == "__main__":
    p = sys.argv[1]
    if os.path.isdir(p):
        print(p)
    elif os.path.isfile(p):
        print(os.path.dirname(p))
    else:
        print('.')



    