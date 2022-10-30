.data
	skipALine: .asciiz "\n"
.globl main
.text
	main:
	li $t0, 0 #test value
	li $t1, 0 
	loop1:
		bge $t1, 10, exit			# Exit the loop if contents of $t1 = 10
		
		addi $a1, $t0, 0
		jal is_prime
		
		move $t3, $v1
		bne $t3, 1, loopAgain
		
		mul $a0, $t0, $t0
		addi $t9, $a0, 0		# $t9 = prime square
		#**********
		jal reverse
		
		move $t4, $v1		# $t4 = reversed
		
		beq $t9, $t4, loopAgain	#Checking for Palindrome
		
		addi $t8, $t4, 0
		
		li $t7, 2
		li $t6, -1	 #iterate
		div $t8, $t7
		
		mflo $t8
		
		loop2:
			bge $t6, $t8, loopAgain
			
			addi $t6, $t6, 1
			
			mul $t3, $t6, $t6
			
			bne $t3, $t4, goToLoop2
			
			addi $a1, $t6, 0		# $t7...test value for is prime
			
			jal is_prime
		
			move $t3, $v1
			bne $t3, 1, goToLoop2
			
			li $v0, 4
			la $a0, skipALine
			syscall
			
			li $v0, 1
			move $a0, $t9
			syscall
			
			addi $t1, $t1, 1
			
			
			j loop2
	
	li $v0, 10
	syscall
	
	goToLoop2:
		
		j loop2
	exit:
		li $v0,10
		syscall
	
	loopAgain:
		addi $t0, $t0, 1
		
		j loop1
	
	is_prime:
	# Test value stored into $t0
	
	li $t3, 2

	prime_for:
		blt $a1, $t3, returnZero
	
		bge $t3, $a1, returnOne
	
		div $a1, $t3
		mfhi $t2
	
		beqz $t2, returnZero
		addi $t3, $t3, 1
		j prime_for
	jr	$ra

	returnOne:
		li $v1, 1
		
		jr $ra
		
		
	returnZero:
		li $v1, 0
		
		jr $ra
	
	reverse:	
		# Test value
		#li	$t2, 123
		
		li $t3, 10
		li $t6, 0 		#remainder
		
		while:
			beqz	$a0, reversed
			div	$a0, $t3
			mfhi	$t5	
			mflo	$a0				
			mul	$t6, $t6, 10
			add	$t6, $t6, $t5
			
			j	while
			
		jr	$ra
		
	reversed:
		move	$v1, $t6
		
		jr	$ra
