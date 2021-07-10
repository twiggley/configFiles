#!/usr/bin/env python

import json
import argparse
import os

parser = argparse.ArgumentParser()
parser.add_argument("input_json")
args = parser.parse_args()

working_dir = os.path.dirname(args.input_json)

print(args.input_json)

with open(args.input_json) as json_file:
    data = json.load(json_file)
    #print(data.keys())
    #print(type(data['comments'][0]))
    stream_number = data["comments"][0]["content_id"]
    print(stream_number)
    #print('"{}":'.format(args.extract_field), data[str(args.extract_field)])
    with open(os.path.dirname(args.input_json) + "/" + stream_number, 'w') as output_file:
        output_file.write(stream_number)

