setup () {
  source test/nltk.org/test001.env
}

@test "the simplest case possible" {
  run make clean run
  run jq -Msce < tmp/*.txt
  [ "$status" -eq 0 ]
}
