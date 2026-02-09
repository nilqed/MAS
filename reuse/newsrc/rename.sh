#!/bin/bash

for a in *.mi; do b=$(basename $a .mi);mv $a  $b.mod; done

for a in *.md; do b=$(basename $a .md);mv $a $b.def; done

