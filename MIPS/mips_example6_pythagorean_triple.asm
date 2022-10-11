# Purpose: To calculate Pythagorean triples
# https://en.wikipedia.org/wiki/Pythagorean_triple
.data
    n: .word 0
    m: .word 0
    request1: .asciiz "Please enter an integer (smaller than 20), n: "
    request2: .asciiz "Please enter integer (smaller than 20), m: "
    answer: .asciiz "The almost pythagorean triple is "
    space: .asciiz " "
.text 
    # Ask for n
        addi $v0, $zero, 4
        la $a0, request1
        syscall
    
    # Get n
        addi $v0, $zero, 5
        syscall
        sw $v0, n
    
    # Ask for m
        addi $v0, $zero, 4
        la $a0, request2
        syscall
    
    # Get m
        addi $v0, $zero, 5
        syscall
        sw $v0, m
    
    # Calculate a
        lw $t0, n
        lw $t1, m
        # m^2 - n^2
            mult $t1, $t1 # m^2
            mflo $t1
            mult $t0, $t0 # n^2
            mflo $t0
            sub $t2, $t1, $t0 # Store a in $t2
    
    # Calculate b
        lw $t0, n
        lw $t1, m
        # 2mn
            mult $t0, $t1
            mflo $t0
            add $t3, $t0, $t0 # Store b in $t3
    
    # Calculate c
        lw $t0, n
        lw $t1, m
        # m^2 + n^2
            mult $t1, $t1 # m^2
            mflo $t1
            mult $t0, $t0 # n^2
            mflo $t0
            add $t4, $t1, $t0 # Store c in $t4
    
    # Print Pythagorean triple
        # Print intro
            addi $v0, $zero, 4
            la $a0, answer
            syscall
        # Print a
            addi $v0, $zero, 1
            add $a0, $t2, $zero
            syscall
        # Print space
            addi $v0, $zero, 4
            la $a0, space
            syscall
        # Print b
            addi $v0, $zero, 1
            add $a0, $t3, $zero
            syscall
        # Print space
            addi $v0, $zero, 4
            la $a0, space
            syscall
        # Print c
            addi $v0, $zero, 1
            add $a0, $t4, $zero
            syscall
    
    # Exit
        addi $v0, $zero, 10
        syscall
