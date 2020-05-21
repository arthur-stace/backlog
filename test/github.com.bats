setup(){
  source test/github.com.test001.env
}

@test "create github README" {
  run make -B tmp/README.txt
  run wc -l tmp/README.txt
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "    7553 tmp/README.txt" ]
}

