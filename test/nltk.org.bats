setup(){
  source test/nltk.org.test001.env
}

@test "create nltk backlog" {
  run make -s -B todo
  run wc -l tmp/*.txt
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "    1286 tmp/ch00.txt" ]
}

