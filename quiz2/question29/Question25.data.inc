		label	L806_x__hla_ dword
		rb	4
		label	L807_y__hla_ dword
		rb	4
		label	L808_five__hla_ dword
		dd	 5.00000000e+00
		label	L809_sixPointOne__hla_ dword
		dd	 6.09999990e+00
		label	L810_sevenPointThree__hla_ dword
		dd	 7.30000019e+00
		label	L811_resultComputed__hla_ dword
		rb	4
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
