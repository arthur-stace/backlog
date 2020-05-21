setup(){
source nltk.env
}

@test "create nltk backlog" {
run make -f nltk.org.mk todo
[ "$status" -eq 0 ]
}
