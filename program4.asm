# program to sum all numbers zero through the user input value using functions
.data
str1: .asciiz "\nEnter N: \n"
str2: .asciiz "\nThe result is: \n"

.text
main:
	#prompt user to enter number
	la $a0, str1
	li $v0, 4
	syscall
	
	#actually entering number
	li $v0, 5
	syscall
	move $s0, $v0 #save N inside $s0
	
	move $a0, $s0
	jal sum
	move $s1, $v0 #save the sum in $s2
	
	# print the sum
	la $a0, str2
	li $v0, 4
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	#exit
	li $v0, 10
	syscall

sum:
	addi $sp, $sp, -4
	sw $s0, 0($sp)
	
	move $t0, $a0 #N
	move $t1, $0 #sum
	
	loop:
		add $t1, $t1, $t0 #sum = sum + n
		subi $t0, $t0, 1 #n--
		bnez $t0, loop #loop condition
	
	move $v0, $t1 #return sum
	
	lw $s0, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
