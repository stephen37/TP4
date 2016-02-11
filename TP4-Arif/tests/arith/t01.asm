.text
#Code principal
main:
	li $a0, 5
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	jal print_int
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	jal print_newline
	li $a0, 1
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	li $a0, 2
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	lw $a1, 0($sp)
	add $sp, $sp, 4
	lw $a0, 0($sp)
	add $sp, $sp, 4
	add $a0, $a0, $a1
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	li $a0, 4
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	lw $a1, 0($sp)
	add $sp, $sp, 4
	lw $a0, 0($sp)
	add $sp, $sp, 4
	sub $a0, $a0, $a1
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	li $a0, 6
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	lw $a1, 0($sp)
	add $sp, $sp, 4
	lw $a0, 0($sp)
	add $sp, $sp, 4
	add $a0, $a0, $a1
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	jal print_int
#Fin
end_exec:
	li $v0, 10
	syscall
#Primitives
print_newline:
	lw $zero, 0($sp)
	add $sp, $sp, 4
	li $v0, 11
	li $a0, 10
	syscall
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	jr $ra
print_int:
	lw $a0, 0($sp)
	add $sp, $sp, 4
	li $v0, 1
	syscall
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	jr $ra
.data
