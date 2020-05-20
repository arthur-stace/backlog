@test "create nltk backlog" {
run make -B -k -f test/test.mk todo
run md5 todo
[ "$status" -eq 0 ]
[ "$output" = "MD5 (todo) = e3cf534f5bfa0abcdbbdcb91dda2ea29" ]
}
