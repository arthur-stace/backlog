setup(){
  source test/ocw.mit.edu.test001.env
}

@test "create ocw backlog" {
  run make -s -B todo
  run wc -l todo
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       8 todo" ]
}

