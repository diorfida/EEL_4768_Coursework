# use a loop to sum all numbers zero through ten
.data
sumtext: .asciiz "\nThe sum is: "
.text
li $s0, 0 #i=0, counter
li $s1, 0 #sum=0

loop: #add procedure
beq $s0, 11, exit
add $s1, $s1, $s0
addi $s0, $s0, 1 #i++
j loop #repeat

exit: # print the result and exit
la $a0, sumtext
li $v0, 4
syscall
move $a0, $s1
li $v0, 1
syscall

li $v0, 10
syscall
