	.text	0x00400000
	.globl	main
	la	$28, _heap_
	la	$4, _inserts_116_
# was:	la	_inserts_116__addr, _inserts_116_
	ori	$3, $0, 40
# was:	ori	_inserts_116__init, 0, 40
	sw	$3, 0($4)
# was:	sw	_inserts_116__init, 0(_inserts_116__addr)
	la	$4, ___str___33_
# was:	la	___str___33__addr, ___str___33_
	ori	$3, $0, 2
# was:	ori	___str___33__init, 0, 2
	sw	$3, 0($4)
# was:	sw	___str___33__init, 0(___str___33__addr)
	la	$4, ___str___18_
# was:	la	___str___18__addr, ___str___18_
	ori	$3, $0, 2
# was:	ori	___str___18__init, 0, 2
	sw	$3, 0($4)
# was:	sw	___str___18__init, 0(___str___18__addr)
	la	$4, _true
# was:	la	_true_addr, _true
	ori	$3, $0, 4
# was:	ori	_true_init, 0, 4
	sw	$3, 0($4)
# was:	sw	_true_init, 0(_true_addr)
	la	$3, _false
# was:	la	_false_addr, _false
	ori	$4, $0, 5
# was:	ori	_false_init, 0, 5
	sw	$4, 0($3)
# was:	sw	_false_init, 0(_false_addr)
	jal	main
_stop_:
	ori	$2, $0, 10
	syscall
# Function writeMMInt
writeMMInt:
	sw	$31, -4($29)
	sw	$20, -24($29)
	sw	$19, -20($29)
	sw	$18, -16($29)
	sw	$17, -12($29)
	sw	$16, -8($29)
	addi	$29, $29, -28
# 	ori	_param_n_1_,2,0
# 	ori	_arr_reg_4_,_param_n_1_,0
	lw	$17, 0($2)
# was:	lw	_size_reg_3_, 0(_arr_reg_4_)
	ori	$16, $28, 0
# was:	ori	_writeMMIntres_2_, 28, 0
	sll	$3, $17, 2
# was:	sll	_tmp_13_, _size_reg_3_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_13_, _tmp_13_, 4
	add	$28, $28, $3
# was:	add	28, 28, _tmp_13_
	sw	$17, 0($16)
# was:	sw	_size_reg_3_, 0(_writeMMIntres_2_)
	addi	$18, $16, 4
# was:	addi	_addr_reg_7_, _writeMMIntres_2_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_8_, 0, 0
	addi	$20, $2, 4
# was:	addi	_elem_reg_5_, _arr_reg_4_, 4
_loop_beg_9_:
	sub	$2, $19, $17
# was:	sub	_tmp_reg_11_, _i_reg_8_, _size_reg_3_
	bgez	$2, _loop_end_10_
# was:	bgez	_tmp_reg_11_, _loop_end_10_
	lw	$2, 0($20)
# was:	lw	_res_reg_6_, 0(_elem_reg_5_)
# 	ori	2,_res_reg_6_,0
	jal	writeMInt
# was:	jal	writeMInt, 2
# 	ori	_tmp_reg_12_,2,0
# 	ori	_res_reg_6_,_tmp_reg_12_,0
	addi	$20, $20, 4
# was:	addi	_elem_reg_5_, _elem_reg_5_, 4
	sw	$2, 0($18)
# was:	sw	_res_reg_6_, 0(_addr_reg_7_)
	addi	$18, $18, 4
# was:	addi	_addr_reg_7_, _addr_reg_7_, 4
	addi	$19, $19, 1
# was:	addi	_i_reg_8_, _i_reg_8_, 1
	j	_loop_beg_9_
_loop_end_10_:
	ori	$2, $16, 0
# was:	ori	2, _writeMMIntres_2_, 0
	addi	$29, $29, 28
	lw	$20, -24($29)
	lw	$19, -20($29)
	lw	$18, -16($29)
	lw	$17, -12($29)
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
# Function writeMInt
writeMInt:
	sw	$31, -4($29)
	sw	$20, -24($29)
	sw	$19, -20($29)
	sw	$18, -16($29)
	sw	$17, -12($29)
	sw	$16, -8($29)
	addi	$29, $29, -28
	ori	$16, $2, 0
# was:	ori	_param_n_14_, 2, 0
	la	$2, ___str___18_
# was:	la	_tmp_17_, ___str___18_
# ___str___18_: string "\n "
# 	ori	_letBind_16_,_tmp_17_,0
# 	ori	2,_tmp_17_,0
	jal	putstring
# was:	jal	putstring, 2
	ori	$2, $16, 0
# was:	ori	_arr_reg_21_, _param_n_14_, 0
	lw	$17, 0($2)
# was:	lw	_size_reg_20_, 0(_arr_reg_21_)
	ori	$16, $28, 0
# was:	ori	_letBind_19_, 28, 0
	sll	$3, $17, 2
# was:	sll	_tmp_30_, _size_reg_20_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_30_, _tmp_30_, 4
	add	$28, $28, $3
# was:	add	28, 28, _tmp_30_
	sw	$17, 0($16)
# was:	sw	_size_reg_20_, 0(_letBind_19_)
	addi	$18, $16, 4
# was:	addi	_addr_reg_24_, _letBind_19_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_25_, 0, 0
	addi	$20, $2, 4
# was:	addi	_elem_reg_22_, _arr_reg_21_, 4
_loop_beg_26_:
	sub	$2, $19, $17
# was:	sub	_tmp_reg_28_, _i_reg_25_, _size_reg_20_
	bgez	$2, _loop_end_27_
# was:	bgez	_tmp_reg_28_, _loop_end_27_
	lw	$2, 0($20)
# was:	lw	_res_reg_23_, 0(_elem_reg_22_)
# 	ori	2,_res_reg_23_,0
	jal	writeInt
# was:	jal	writeInt, 2
# 	ori	_tmp_reg_29_,2,0
# 	ori	_res_reg_23_,_tmp_reg_29_,0
	addi	$20, $20, 4
# was:	addi	_elem_reg_22_, _elem_reg_22_, 4
	sw	$2, 0($18)
# was:	sw	_res_reg_23_, 0(_addr_reg_24_)
	addi	$18, $18, 4
# was:	addi	_addr_reg_24_, _addr_reg_24_, 4
	addi	$19, $19, 1
# was:	addi	_i_reg_25_, _i_reg_25_, 1
	j	_loop_beg_26_
_loop_end_27_:
	la	$2, ___str___33_
# was:	la	_tmp_32_, ___str___33_
# ___str___33_: string " \n"
# 	ori	_letBind_31_,_tmp_32_,0
# 	ori	2,_tmp_32_,0
	jal	putstring
# was:	jal	putstring, 2
	ori	$2, $16, 0
# was:	ori	_writeMIntres_15_, _letBind_19_, 0
# 	ori	2,_writeMIntres_15_,0
	addi	$29, $29, 28
	lw	$20, -24($29)
	lw	$19, -20($29)
	lw	$18, -16($29)
	lw	$17, -12($29)
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
# Function writeInt
writeInt:
	sw	$31, -4($29)
	sw	$16, -8($29)
	addi	$29, $29, -12
# 	ori	_param_i_34_,2,0
	ori	$16, $2, 0
# was:	ori	_tmp_36_, _param_i_34_, 0
# 	ori	_writeIntres_35_,_tmp_36_,0
	ori	$2, $16, 0
# was:	ori	2, _writeIntres_35_, 0
	jal	putint
# was:	jal	putint, 2
	ori	$2, $16, 0
# was:	ori	2, _writeIntres_35_, 0
	addi	$29, $29, 12
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
# Function readInt
readInt:
	sw	$31, -4($29)
	addi	$29, $29, -8
# 	ori	_param_i_37_,2,0
	jal	getint
# was:	jal	getint, 2
# 	ori	_readIntres_38_,2,0
# 	ori	2,_readIntres_38_,0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
# Function readIntArr
readIntArr:
	sw	$31, -4($29)
	sw	$20, -24($29)
	sw	$19, -20($29)
	sw	$18, -16($29)
	sw	$17, -12($29)
	sw	$16, -8($29)
	addi	$29, $29, -28
# 	ori	_param_n_39_,2,0
	ori	$3, $2, 0
# was:	ori	_size_reg_45_, _param_n_39_, 0
	addi	$3, $3, -1
# was:	addi	_size_reg_45_, _size_reg_45_, -1
	bgez	$3, _safe_lab_46_
# was:	bgez	_size_reg_45_, _safe_lab_46_
	ori	$5, $0, 11
# was:	ori	5, 0, 11
	j	_IllegalArrSizeError_
_safe_lab_46_:
	addi	$3, $3, 1
# was:	addi	_size_reg_45_, _size_reg_45_, 1
	ori	$2, $28, 0
# was:	ori	_arr_reg_42_, 28, 0
	sll	$4, $3, 2
# was:	sll	_tmp_52_, _size_reg_45_, 2
	addi	$4, $4, 4
# was:	addi	_tmp_52_, _tmp_52_, 4
	add	$28, $28, $4
# was:	add	28, 28, _tmp_52_
	sw	$3, 0($2)
# was:	sw	_size_reg_45_, 0(_arr_reg_42_)
	addi	$4, $2, 4
# was:	addi	_addr_reg_47_, _arr_reg_42_, 4
	ori	$5, $0, 0
# was:	ori	_i_reg_48_, 0, 0
_loop_beg_49_:
	sub	$6, $5, $3
# was:	sub	_tmp_reg_51_, _i_reg_48_, _size_reg_45_
	bgez	$6, _loop_end_50_
# was:	bgez	_tmp_reg_51_, _loop_end_50_
	sw	$5, 0($4)
# was:	sw	_i_reg_48_, 0(_addr_reg_47_)
	addi	$4, $4, 4
# was:	addi	_addr_reg_47_, _addr_reg_47_, 4
	addi	$5, $5, 1
# was:	addi	_i_reg_48_, _i_reg_48_, 1
	j	_loop_beg_49_
_loop_end_50_:
	lw	$17, 0($2)
# was:	lw	_size_reg_41_, 0(_arr_reg_42_)
	ori	$16, $28, 0
# was:	ori	_readIntArrres_40_, 28, 0
	sll	$3, $17, 2
# was:	sll	_tmp_59_, _size_reg_41_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_59_, _tmp_59_, 4
	add	$28, $28, $3
# was:	add	28, 28, _tmp_59_
	sw	$17, 0($16)
# was:	sw	_size_reg_41_, 0(_readIntArrres_40_)
	addi	$18, $16, 4
# was:	addi	_addr_reg_53_, _readIntArrres_40_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_54_, 0, 0
	addi	$20, $2, 4
# was:	addi	_elem_reg_43_, _arr_reg_42_, 4
_loop_beg_55_:
	sub	$2, $19, $17
# was:	sub	_tmp_reg_57_, _i_reg_54_, _size_reg_41_
	bgez	$2, _loop_end_56_
# was:	bgez	_tmp_reg_57_, _loop_end_56_
	lw	$2, 0($20)
# was:	lw	_res_reg_44_, 0(_elem_reg_43_)
# 	ori	2,_res_reg_44_,0
	jal	readInt
# was:	jal	readInt, 2
# 	ori	_tmp_reg_58_,2,0
# 	ori	_res_reg_44_,_tmp_reg_58_,0
	addi	$20, $20, 4
# was:	addi	_elem_reg_43_, _elem_reg_43_, 4
	sw	$2, 0($18)
# was:	sw	_res_reg_44_, 0(_addr_reg_53_)
	addi	$18, $18, 4
# was:	addi	_addr_reg_53_, _addr_reg_53_, 4
	addi	$19, $19, 1
# was:	addi	_i_reg_54_, _i_reg_54_, 1
	j	_loop_beg_55_
_loop_end_56_:
	ori	$2, $16, 0
# was:	ori	2, _readIntArrres_40_, 0
	addi	$29, $29, 28
	lw	$20, -24($29)
	lw	$19, -20($29)
	lw	$18, -16($29)
	lw	$17, -12($29)
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
# Function max
max:
	sw	$31, -4($29)
	addi	$29, $29, -8
# 	ori	_param_a_60_,2,0
# 	ori	_param_b_61_,3,0
# 	ori	_lt_L_67_,_param_b_61_,0
# 	ori	_lt_R_68_,_param_a_60_,0
	slt	$4, $3, $2
# was:	slt	_cond_66_, _lt_L_67_, _lt_R_68_
	bne	$4, $0, _then_63_
# was:	bne	_cond_66_, 0, _then_63_
	j	_else_64_
_then_63_:
# 	ori	_maxres_62_,_param_a_60_,0
	j	_endif_65_
_else_64_:
	ori	$2, $3, 0
# was:	ori	_maxres_62_, _param_b_61_, 0
_endif_65_:
# 	ori	2,_maxres_62_,0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
# Function createArr
createArr:
	sw	$31, -4($29)
	addi	$29, $29, -8
# 	ori	_param_i_69_,2,0
	ori	$3, $2, 0
# was:	ori	_size_reg_75_, _param_i_69_, 0
	addi	$3, $3, -1
# was:	addi	_size_reg_75_, _size_reg_75_, -1
	bgez	$3, _safe_lab_76_
# was:	bgez	_size_reg_75_, _safe_lab_76_
	ori	$5, $0, 15
# was:	ori	5, 0, 15
	j	_IllegalArrSizeError_
_safe_lab_76_:
	addi	$3, $3, 1
# was:	addi	_size_reg_75_, _size_reg_75_, 1
	ori	$2, $28, 0
# was:	ori	_arr_reg_72_, 28, 0
	sll	$4, $3, 2
# was:	sll	_tmp_82_, _size_reg_75_, 2
	addi	$4, $4, 4
# was:	addi	_tmp_82_, _tmp_82_, 4
	add	$28, $28, $4
# was:	add	28, 28, _tmp_82_
	sw	$3, 0($2)
# was:	sw	_size_reg_75_, 0(_arr_reg_72_)
	addi	$5, $2, 4
# was:	addi	_addr_reg_77_, _arr_reg_72_, 4
	ori	$6, $0, 0
# was:	ori	_i_reg_78_, 0, 0
_loop_beg_79_:
	sub	$4, $6, $3
# was:	sub	_tmp_reg_81_, _i_reg_78_, _size_reg_75_
	bgez	$4, _loop_end_80_
# was:	bgez	_tmp_reg_81_, _loop_end_80_
	sw	$6, 0($5)
# was:	sw	_i_reg_78_, 0(_addr_reg_77_)
	addi	$5, $5, 4
# was:	addi	_addr_reg_77_, _addr_reg_77_, 4
	addi	$6, $6, 1
# was:	addi	_i_reg_78_, _i_reg_78_, 1
	j	_loop_beg_79_
_loop_end_80_:
	lw	$4, 0($2)
# was:	lw	_size_reg_71_, 0(_arr_reg_72_)
	ori	$3, $28, 0
# was:	ori	_createArrres_70_, 28, 0
	sll	$5, $4, 2
# was:	sll	_tmp_88_, _size_reg_71_, 2
	addi	$5, $5, 4
# was:	addi	_tmp_88_, _tmp_88_, 4
	add	$28, $28, $5
# was:	add	28, 28, _tmp_88_
	sw	$4, 0($3)
# was:	sw	_size_reg_71_, 0(_createArrres_70_)
	addi	$5, $3, 4
# was:	addi	_addr_reg_83_, _createArrres_70_, 4
	ori	$6, $0, 0
# was:	ori	_i_reg_84_, 0, 0
	addi	$2, $2, 4
# was:	addi	_elem_reg_73_, _arr_reg_72_, 4
_loop_beg_85_:
	sub	$7, $6, $4
# was:	sub	_tmp_reg_87_, _i_reg_84_, _size_reg_71_
	bgez	$7, _loop_end_86_
# was:	bgez	_tmp_reg_87_, _loop_end_86_
	lw	$7, 0($2)
# was:	lw	_res_reg_74_, 0(_elem_reg_73_)
# 	ori	_res_reg_74_,_res_reg_74_,0
	addi	$2, $2, 4
# was:	addi	_elem_reg_73_, _elem_reg_73_, 4
	sw	$7, 0($5)
# was:	sw	_res_reg_74_, 0(_addr_reg_83_)
	addi	$5, $5, 4
# was:	addi	_addr_reg_83_, _addr_reg_83_, 4
	addi	$6, $6, 1
# was:	addi	_i_reg_84_, _i_reg_84_, 1
	j	_loop_beg_85_
_loop_end_86_:
	ori	$2, $3, 0
# was:	ori	2, _createArrres_70_, 0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
# Function createArrElement
createArrElement:
	sw	$31, -4($29)
	addi	$29, $29, -8
# 	ori	_param_i_89_,2,0
# 	ori	_arg_91_,_param_i_89_,0
# 	ori	2,_arg_91_,0
	jal	readIntArr
# was:	jal	readIntArr, 2
# 	ori	_createArrElementres_90_,2,0
# 	ori	2,_createArrElementres_90_,0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
# Function createMatrix
createMatrix:
	sw	$31, -4($29)
	sw	$21, -28($29)
	sw	$20, -24($29)
	sw	$19, -20($29)
	sw	$18, -16($29)
	sw	$17, -12($29)
	sw	$16, -8($29)
	addi	$29, $29, -32
	ori	$16, $2, 0
# was:	ori	_param_i_92_, 2, 0
	ori	$3, $16, 0
# was:	ori	_size_reg_98_, _param_i_92_, 0
	addi	$3, $3, -1
# was:	addi	_size_reg_98_, _size_reg_98_, -1
	bgez	$3, _safe_lab_99_
# was:	bgez	_size_reg_98_, _safe_lab_99_
	ori	$5, $0, 18
# was:	ori	5, 0, 18
	j	_IllegalArrSizeError_
_safe_lab_99_:
	addi	$3, $3, 1
# was:	addi	_size_reg_98_, _size_reg_98_, 1
	ori	$2, $28, 0
# was:	ori	_arr_reg_95_, 28, 0
	sll	$4, $3, 2
# was:	sll	_tmp_105_, _size_reg_98_, 2
	addi	$4, $4, 4
# was:	addi	_tmp_105_, _tmp_105_, 4
	add	$28, $28, $4
# was:	add	28, 28, _tmp_105_
	sw	$3, 0($2)
# was:	sw	_size_reg_98_, 0(_arr_reg_95_)
	addi	$5, $2, 4
# was:	addi	_addr_reg_100_, _arr_reg_95_, 4
	ori	$4, $0, 0
# was:	ori	_i_reg_101_, 0, 0
_loop_beg_102_:
	sub	$6, $4, $3
# was:	sub	_tmp_reg_104_, _i_reg_101_, _size_reg_98_
	bgez	$6, _loop_end_103_
# was:	bgez	_tmp_reg_104_, _loop_end_103_
	sw	$4, 0($5)
# was:	sw	_i_reg_101_, 0(_addr_reg_100_)
	addi	$5, $5, 4
# was:	addi	_addr_reg_100_, _addr_reg_100_, 4
	addi	$4, $4, 1
# was:	addi	_i_reg_101_, _i_reg_101_, 1
	j	_loop_beg_102_
_loop_end_103_:
	lw	$18, 0($2)
# was:	lw	_size_reg_94_, 0(_arr_reg_95_)
	ori	$17, $28, 0
# was:	ori	_createMatrixres_93_, 28, 0
	sll	$3, $18, 2
# was:	sll	_tmp_112_, _size_reg_94_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_112_, _tmp_112_, 4
	add	$28, $28, $3
# was:	add	28, 28, _tmp_112_
	sw	$18, 0($17)
# was:	sw	_size_reg_94_, 0(_createMatrixres_93_)
	addi	$19, $17, 4
# was:	addi	_addr_reg_106_, _createMatrixres_93_, 4
	ori	$20, $0, 0
# was:	ori	_i_reg_107_, 0, 0
	addi	$21, $2, 4
# was:	addi	_elem_reg_96_, _arr_reg_95_, 4
_loop_beg_108_:
	sub	$2, $20, $18
# was:	sub	_tmp_reg_110_, _i_reg_107_, _size_reg_94_
	bgez	$2, _loop_end_109_
# was:	bgez	_tmp_reg_110_, _loop_end_109_
	lw	$2, 0($21)
# was:	lw	_res_reg_97_, 0(_elem_reg_96_)
	ori	$2, $16, 0
# was:	ori	_arg_111_, _param_i_92_, 0
# 	ori	2,_arg_111_,0
	jal	createArrElement
# was:	jal	createArrElement, 2
# 	ori	_res_reg_97_,2,0
	addi	$21, $21, 4
# was:	addi	_elem_reg_96_, _elem_reg_96_, 4
	sw	$2, 0($19)
# was:	sw	_res_reg_97_, 0(_addr_reg_106_)
	addi	$19, $19, 4
# was:	addi	_addr_reg_106_, _addr_reg_106_, 4
	addi	$20, $20, 1
# was:	addi	_i_reg_107_, _i_reg_107_, 1
	j	_loop_beg_108_
_loop_end_109_:
	ori	$2, $17, 0
# was:	ori	2, _createMatrixres_93_, 0
	addi	$29, $29, 32
	lw	$21, -28($29)
	lw	$20, -24($29)
	lw	$19, -20($29)
	lw	$18, -16($29)
	lw	$17, -12($29)
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
# Function insert
insert:
	sw	$31, -4($29)
	addi	$29, $29, -8
	la	$2, _inserts_116_
# was:	la	_tmp_115_, _inserts_116_
# _inserts_116_: string "insert size of the squared matrix n*n: \n"
# 	ori	_letBind_114_,_tmp_115_,0
# 	ori	2,_tmp_115_,0
	jal	putstring
# was:	jal	putstring, 2
	jal	getint
# was:	jal	getint, 2
# 	ori	_letBind_117_,2,0
# 	ori	_arg_118_,_letBind_117_,0
# 	ori	2,_arg_118_,0
	jal	createMatrix
# was:	jal	createMatrix, 2
# 	ori	_insertres_113_,2,0
# 	ori	2,_insertres_113_,0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
# Function main
main:
	sw	$31, -4($29)
	addi	$29, $29, -8
	jal	insert
# was:	jal	insert, 
# 	ori	_letBind_120_,2,0
# 	ori	_arg_121_,_letBind_120_,0
# 	ori	2,_arg_121_,0
	jal	writeMMInt
# was:	jal	writeMMInt, 2
# 	ori	_mainres_119_,2,0
# 	ori	2,_mainres_119_,0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
ord:
	jr	$31
chr:
	andi	$2, $2, 255
	jr	$31
putint:
	addi	$29, $29, -8
	sw	$2, 0($29)
	sw	$4, 4($29)
	ori	$4, $2, 0
	ori	$2, $0, 1
	syscall
	ori	$2, $0, 4
	la	$4, _space_
	syscall
	lw	$2, 0($29)
	lw	$4, 4($29)
	addi	$29, $29, 8
	jr	$31
getint:
	ori	$2, $0, 5
	syscall
	jr	$31
putchar:
	addi	$29, $29, -8
	sw	$2, 0($29)
	sw	$4, 4($29)
	ori	$4, $2, 0
	ori	$2, $0, 11
	syscall
	ori	$2, $0, 4
	la	$4, _space_
	syscall
	lw	$2, 0($29)
	lw	$4, 4($29)
	addi	$29, $29, 8
	jr	$31
dynalloc:
	ori	$4, $2, 0
	ori	$2, $0, 9
	syscall
	jr	$31
getchar:
	addi	$29, $29, -8
	sw	$4, 0($29)
	sw	$5, 4($29)
	ori	$2, $0, 12
	syscall
	ori	$5, $2, 0
	ori	$2, $0, 4
	la	$4, _cr_
	syscall
	ori	$2, $5, 0
	lw	$4, 0($29)
	lw	$5, 4($29)
	addi	$29, $29, 8
	jr	$31
putstring:
	addi	$29, $29, -16
	sw	$2, 0($29)
	sw	$4, 4($29)
	sw	$5, 8($29)
	sw	$6, 12($29)
	lw	$4, 0($2)
	addi	$5, $2, 4
	add	$6, $5, $4
	ori	$2, $0, 11
putstring_begin:
	sub	$4, $5, $6
	bgez	$4, putstring_done
	lb	$4, 0($5)
	syscall
	addi	$5, $5, 1
	j	putstring_begin
putstring_done:
	lw	$2, 0($29)
	lw	$4, 4($29)
	lw	$5, 8($29)
	lw	$6, 12($29)
	addi	$29, $29, 16
	jr	$31
_IllegalArrSizeError_:
	la	$4, _IllegalArrSizeString_
	ori	$2, $0, 4
	syscall
	ori	$4, $5, 0
	ori	$2, $0, 1
	syscall
	la	$4, _cr_
	ori	$2, $0, 4
	syscall
	j	_stop_
	.data	
_cr_:
	.asciiz	"\n"
_space_:
	.asciiz	" "
_IllegalArrSizeString_:
	.asciiz	"Error: Array size less or equal to 0 at line "
# String Literals
	.align	2
_inserts_116_:
	.space	4
	.asciiz	"insert size of the squared matrix n*n: \n"
	.align	2
___str___33_:
	.space	4
	.asciiz	" \n"
	.align	2
___str___18_:
	.space	4
	.asciiz	"\n "
	.align	2
_true:
	.space	4
	.asciiz	"True"
	.align	2
_false:
	.space	4
	.asciiz	"False"
	.align	2
_heap_:
	.space	100000
