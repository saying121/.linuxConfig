#! /bin/bash

name=-----------------
echo $name
echo $((1 > 1))
echo $name
a=""
b="yuyu"
[[ -n "$a" && "$a" = "$b" ]] && echo yes || echo no
your_name="qinjx"
greeting="hello, $your_name !"
greeting_1="hello, ${your_name} !"
echo "$greeting $greeting_1"
mouth=8
echo "${mouth}-1-2000"
