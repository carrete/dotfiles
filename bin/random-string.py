#!/usr/bin/env python3
# -*- mode: python; coding: utf-8; tab-width: 4; indent-tabs-mode: nil -*-

import argparse
import random
import string

parser = argparse.ArgumentParser(description="Generate a string of random characters")

parser.add_argument("--nchars", action="store", type=int, default=16)
parser.add_argument("--letters", action=argparse.BooleanOptionalAction, default=True)
parser.add_argument("--digits", action=argparse.BooleanOptionalAction, default=True)
parser.add_argument("--punctuation", action=argparse.BooleanOptionalAction, default=True)

args = parser.parse_args()

chars = ""

if args.letters:
    chars += string.ascii_letters

if args.digits:
    chars += string.digits

if args.punctuation:
    chars += string.punctuation

print("".join([random.choice(chars) for i in range(args.nchars)]))
