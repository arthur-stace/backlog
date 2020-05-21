setup(){
  source test/github.com.test001.env
}

@test "create github README" {
  run make run
  run wc -l todo
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      94 todo" ]
}

