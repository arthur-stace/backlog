cat $@ \
| tail -n +4 \
| split -p 'Musical Design Reports|Sonic System Project and Presentation' - ocw_proj

