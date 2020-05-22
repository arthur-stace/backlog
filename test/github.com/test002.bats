setup(){
  source test/github.com/shared.env
  source test/github.com/test002.env
}

@test "captured valid json" {
  run make todo
  [ "$status" -eq 0 ]
}

