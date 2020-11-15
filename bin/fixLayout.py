#!/usr/bin/env python3
#
# fixLayout.py
#
# fix i3 layout
#
#################################

import argparse
import re

#################################
# args
#################################
parser = argparse.ArgumentParser()
parser.add_argument("file", help="file to check", type=str)
parser.add_argument("-m", "--mode", help="1 for fixed file to stdout, 2 for script", type=int, default=1)
args = parser.parse_args()

#################################
# constants
#################################
mode = args.mode

script_equiv = {'UXTerm': 'i3-sensible-terminal', 'firefox': 'firefox'}

output_file = []
found_class = []

with open(args.file) as f:
    #pattern = re.compile(r"//( \"(class|instance)\": \"\^(UXTerm|xterm)\$\"),?")
    c_pattern = re.compile(r"(^\s+)//( \"class\": \"\^(.*)\$\"),")
    #i_pattern = re.compile(r"(^\s+)//( \"(instance)\": \"\^(xterm)\$\"),?")

    lines = f.readlines()
    for line in lines:
        c_match = c_pattern.search(line)
        #i_match = i_pattern.search(line)
        if c_match:
            found_class.append(c_match.group(3))
            print(c_match.group(3))
            output_file.append(c_match.group(1) + "  " + c_match.group(2) + "\n")
        #elif i_match:
        #    print(i_match.group(1) + "  " + i_match.group(2))
        else:
            output_file.append(line)

if mode == 1:
    print(''.join(output_file))
elif mode == 2:
    print(found_class)
    print(str('bindsym $mod+Shift+d append_layout ' +  args.file + '\n') + '\n'.join(str(script_equiv[a]) + ' &' for a in found_class))
else:
    print('output file: '.join(output_file))
    print('found objects: '.join(found_class))


