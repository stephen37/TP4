.text
#Code principal
main:
	li $a0, 9
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	jal print_int
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	jal print_newline
	li $a0, 1
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	lw $a0, 0($sp)
	add $sp, $sp, 4
	bnez $a0, __label__00005
	li $a0, 1
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	lw $a0, 0($sp)
	add $sp, $sp, 4
	bnez $a0, __label__00003
	li $a0, 4
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	jal print_int
	b __label__00004
__label__00003:
	li $a0, 3
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	jal print_int
__label__00004:
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	b __label__00006
__label__00005:
	li $a0, 0
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	lw $a0, 0($sp)
	add $sp, $sp, 4
	bnez $a0, __label__00001
	li $a0, 9
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	jal print_int
	b __label__00002
__label__00001:
	li $a0, 5
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	jal print_int
__label__00002:
	sub $sp, $sp, 4
	sw $a0, 0($sp)
__label__00006:
	sub $sp, $sp, 4
	sw $a0, 0($sp)
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
