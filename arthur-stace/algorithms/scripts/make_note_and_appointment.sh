mkdir -p tmp/notes
for input in $(ls x*); do
  tempfile=tmp/$input
  SHA1=$(cat $tempfile | shasum)
  cat $input >> $tempfile
  touch tmp/notes/$SHA1
  NOTE_ID=$(basename `ls -tr tmp/notes | tail -n 1`)
  cat $tempfile > tmp/notes/$NOTE_ID


  START_TIME=$(date +%H:%M)
  START_DATE=$(date +%m/%d/%Y)
  END_DATE=$START_DATE
  END_TIME=$(date -v +2H +%H:%M)

  DESCRIPTION=$(grep Unit $tempfile | head -n 1)

  echo "$START_DATE @ $START_TIME -> $END_DATE @ $END_TIME >$NOTE_ID | $DESCRIPTION" >> apts
done
mv tmp/notes/* notes/
rm x*
