#!/usr/bin/env sh

cat $@ \
| tail -n +21 \
| split -l 3 - ocw_lec

