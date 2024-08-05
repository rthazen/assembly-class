		label	L806_value1__hla_ byte
		rb	1
		label	L807_value2__hla_ byte
		rb	1
		label	L808_value3__hla_ byte
		rb	1
		label	L810_iReturnAddress__hla_ dword
		rb	4
		label	L811_iTemporary__hla_ word
		rb	2
		label	L812_iRegisterValue__hla_ dword
		rb	4
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
