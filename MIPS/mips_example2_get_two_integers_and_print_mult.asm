.data
string1: .asciiz "Enter an integer:"
string2: .asciiz "Enter another integer:"
string3: .asciiz "Result(low part):"
string4: .asciiz "Result(high part):"
endLine: .asciiz "\n"

.text
main:
# system call codes
# 4: print string
# 5: read integer
# 1: print integer
# 10: exit

	li $v0, 4      
	la $a0, string1
	syscall
	
	li $v0, 5 
	syscall
	move $t0, $v0
		
	li $v0, 4
	la $a0, string2
	syscall
	
	li $v0, 5	
	syscall
	move $t1, $v0
	
	li $v0, 4
	la $a0, string3
	syscall
	
	mult $t0, $t1
	mflo $a0
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, endLine
	syscall
	
	li $v0, 4
	la $a0, string4
	syscall
	
	mfhi $a0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
# Try calculating 66000^2
# MIPS will give you
#  Low Part = 61032704
#  High Part = 1	
# Because 66000^2 = 1*2^32 +61032704

