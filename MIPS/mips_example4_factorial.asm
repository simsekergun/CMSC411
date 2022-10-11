# This code asks for an integer and then calculates its factorial and prints it
.data
string1: .asciiz "Enter an integer (less than 10 please):"
string2: .asciiz "! = " 	# at the end, we will print in the following format 5! = 120
endLine: .asciiz "\n"

.text
main:
	li $v0, 4
	la $a0, string1		# print string1
	syscall
	
	li $v0, 5 		# get an integer
	syscall			
	move $t2,$v0		# move the entry to a temporary
	 
	li $t0, 1		# t0 -> result	
	li $t1, 1                # t1 -> loop counter
	
LoopStart:
	bgt  $t1, $t2, endLoop	# if (t1>t2) goto endLoop
	mul  $t0,$t0,$t1
	addi $t1,$t1,1                  # ++i
	j LoopStart

endLoop:
	li   $v0, 1	
	move $a0, $t2
	syscall            # print the input number
	
	li $v0,4
	la $a0,string2     # print string2
	syscall
	
	li $v0,1
	move $a0,$t0
	syscall            # -> print result
	
	li $v0,10
	syscall
	
