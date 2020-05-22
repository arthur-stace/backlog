setup(){
  source test/nltk.org.test001.env
}

@test "create nltk backlog" {
  run make clean todo
  [ "$status" -eq 0 ]
}


