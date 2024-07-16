		label	L806_startingValue__hla_ dword
		rb	4
		label	L807_add1__hla_ dword
		rb	4
		label	L808_add2__hla_ dword
		rb	4
		label	L809_add3__hla_ dword
		rb	4
		label	L810_add4__hla_ dword
		rb	4
		label	L811_add5__hla_ dword
		rb	4
		label	L812_add6__hla_ dword
		rb	4
		label	L813_add7__hla_ dword
		rb	4
		label	L814_add8__hla_ dword
		rb	4
		label	L815_add9__hla_ dword
		rb	4
		label	L816_add10__hla_ dword
		rb	4
		label	L817_add11__hla_ dword
		rb	4
		label	L818_add12__hla_ dword
		rb	4
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
