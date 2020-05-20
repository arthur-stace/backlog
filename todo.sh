input=`basename $@`
output=`dirname $@`

touch $output/`shasum $input`

file=`basename $(ls -tr $output | tail -n 1)`

cat $input > $output/$file

desc=`cat $input | head -n 2 | head -c 45`

echo '[0]>'$file' '$desc''
