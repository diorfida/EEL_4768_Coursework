# palindrome check
.data
str: .asciiz "racecar"
len: .word 7
isPalStr: .asciiz " is a palindrome\n"
isNotPalStr: .asciiz " is NOT a palindrome\n"

.text
la $s0, str #pointer to the first character of the string
lw $s1, len
subi $s1, $s1, 1
add $s1, $s1, $s0 #pointer to the last character of the string

loop:
	lb $t0, 0($s0)
	lb $t1, 0($s1)
	bne $t0, $t1, notP
	addi $s0, $s0, 1
	subi $s1, $s1, 1
	ble $s1, $s0, yesP
	j loop
	
yesP:
	la $a0, str
	li $v0, 4
	syscall
	la $a0, isPalStr
	li $v0, 4
	syscall
	j exit
	
notP:
	la $a0, str
	li $v0, 4
	syscall
	la $a0, isNotPalStr
	li $v0, 4
	syscall
	j exit

exit:
	li $v0, 10
	syscall
