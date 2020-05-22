setup(){
  source test/github.com/shared.env
  source test/github.com/test001.env
}

@test "model valid json" {
  skip "understand how to capture make output"
  run make -n todo
  [ "$status" -eq 0 ]
}

