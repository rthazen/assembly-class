		label	L806_i__hla_ byte
		db	0ch
		label	L807_j__hla_ byte
		db	0eh
		label	L808_pI__hla_ dword
		rb	4
		label	L810_dReturnAddress__hla_ dword
		rb	4
		label	L811_iTemporary__hla_ byte
		rb	1
		label	L812_dEDXRegister__hla_ dword
		dd	00h
		label	L813_dECXRegister__hla_ dword
		dd	00h
		label	L814_dEBXRegister__hla_ dword
		dd	00h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
