cat $@ \
| split -p ^$ - ocw_read
