.text
#Code principal
main:
	li $a0, 235710
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	jal print_int
	sub $sp, $sp, 4
	sw $zero, 0($sp)
	jal print_newline
	li $a0, 12
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	li $a0, 25
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	lw $a1, 0($sp)
	add $sp, $sp, 4
	lw $a0, 0($sp)
	add $sp, $sp, 4
	seq $a0, $a0, $a1
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	lw $a0, 0($sp)
	add $sp, $sp, 4
	bnez $a0, __label__00009
	li $a0, 2
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	jal print_int
	b __label__00010
__label__00009:
	li $a0, 1
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	jal print_int
__label__00010:
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	li $a0, 12
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	li $a0, 25
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	lw $a1, 0($sp)
	add $sp, $sp, 4
	lw $a0, 0($sp)
	add $sp, $sp, 4
	sne $a0, $a0, $a1
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	lw $a0, 0($sp)
	add $sp, $sp, 4
	bnez $a0, __label__00007
	li $a0, 4
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	jal print_int
	b __label__00008
__label__00007:
	li $a0, 3
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	jal print_int
__label__00008:
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	li $a0, 12
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	li $a0, 25
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	lw $a1, 0($sp)
	add $sp, $sp, 4
	lw $a0, 0($sp)
	add $sp, $sp, 4
	slt $a0, $a0, $a1
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	lw $a0, 0($sp)
	add $sp, $sp, 4
	bnez $a0, __label__00005
	li $a0, 6
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	jal print_int
	b __label__00006
__label__00005:
	li $a0, 5
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	jal print_int
__label__00006:
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	li $a0, 25
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	li $a0, 25
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	lw $a1, 0($sp)
	add $sp, $sp, 4
	lw $a0, 0($sp)
	add $sp, $sp, 4
	sle $a0, $a0, $a1
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	lw $a0, 0($sp)
	add $sp, $sp, 4
	bnez $a0, __label__00003
	li $a0, 8
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	jal print_int
	b __label__00004
__label__00003:
	li $a0, 7
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	jal print_int
__label__00004:
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	li $a0, 12
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	li $a0, 25
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	lw $a1, 0($sp)
	add $sp, $sp, 4
	lw $a0, 0($sp)
	add $sp, $sp, 4
	sge $a0, $a0, $a1
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	lw $a0, 0($sp)
	add $sp, $sp, 4
	bnez $a0, __label__00001
	li $a0, 10
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	jal print_int
	b __label__00002
__label__00001:
	li $a0, 9
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	jal print_int
__label__00002:
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
