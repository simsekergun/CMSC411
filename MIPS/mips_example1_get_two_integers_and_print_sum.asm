.data
string1: .asciiz "Enter an integer:"
string2: .asciiz "Enter another integer:"
string3: .asciiz "Sum:"
endLine: .asciiz "\n"

.text
main:
	# li pseudo-instruction loads an immediate value into a register.
	li $v0, 4		# System call code:4 means, we will print something to the screen 
	la $a0, string1  
	syscall

	li $v0 , 5	 	# System call code:5 means, we will read an integer
	syscall
	
	move $t0,$v0            # Let's move the entered integer into register $t0
	
	li $v0 , 4
	la $a0 , endLine        # Let's print a new line 
	syscall
	
	li $v0 , 4
	la $a0 , string2        
	syscall
	
	li $v0 , 5
	syscall
	
	move $t1,$v0    	# Let's move the entered second integer into register $t1         
	
	li $v0 , 4
	la $a0 , string3
	syscall
	
	add $t2,$t1,$t0		# Let's add these two integers and put the result into $t2
	li $v0, 1		# System call code:1 means, we will print an integer
	move $a0, $t2		# Let's pass this number to $a0 and call 
	syscall
	
	li $v0, 10              # System call code:10 means, we will exit the program
	syscall
	
