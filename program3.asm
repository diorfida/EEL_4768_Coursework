# reverse the contents of an array
.data
str1: .asciiz "\nArray 1 is: \n"
str2: .asciiz "\nArray 2 is: \n"
space: .asciiz " "

count: .word 5

array1: .word 1, 2, 3, 4, 5
array2: .word

.text
la $s0, array1 + 16 #pointer to last element of array 1
lw $t0, count

la $s1, array2 #pointer to first element of array 2

loop: 
beqz $t0, printArray1

lw $t1, 0($s0) #read from array 1
sw $t1, 0($s1) #write to array 2

subi $t0, $t0, 1 #count--
subi $s0, $s0, 4 #decrement array 1 pointer
addi $s1, $s1, 4 #increment array 2 pointer

j loop

#print new array here
printArray1: 
lw $t0, count 
la $s0, array1 # array 1 pointer

la $a0, str1 # print the "array is" message
li $v0, 4
syscall

loopArray1:
beqz $t0, printArray2
lw $s1, 0($s0)
li $v0, 1
move $a0, $s1
syscall

la $a0, space
li $v0, 4
syscall

subi $t0, $t0, 1 #decrement counter by 1
addi $s0, $s0, 4 #increment address by 4

j loopArray1

printArray2: 
lw $t0, count 
la $s0, array2 # array 2 pointer

la $a0, str2 # print the "array is" message
li $v0, 4
syscall

loopArray2:
beqz $t0, exit
lw $s1, 0($s0)
li $v0, 1
move $a0, $s1
syscall

la $a0, space
li $v0, 4
syscall

subi $t0, $t0, 1 #decrement counter by 1
addi $s0, $s0, 4 #increment address by 4

j loopArray2

exit:
li $v0, 10
syscall
