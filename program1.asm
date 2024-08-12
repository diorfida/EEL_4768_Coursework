# compare 3 numbers and store largest number in register $s4
.text
li $s0, 10 #a
li $s1, 2 #b
li $s2, 14 #c
bgt $s0, $s1, next1
bgt $s2, $s1, next2
move $s4, $s1 #b is greatest
b exit

next1: 
bgt $s2, $s0, next2
move $s4, $s0 #a is greatest
b exit

next2: 
move $s4, $s2 #c is greatest
b exit

exit: 
li $v0, 10
syscall