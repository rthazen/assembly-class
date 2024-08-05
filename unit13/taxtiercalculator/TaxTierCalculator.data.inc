		label	L806_income__hla_ dword
		rb	4
		label	L807_tier_code__hla_ byte
		db	00h
		label	L809_returnAddress__hla_ dword
		rb	4
		label	L810_TIER_A__hla_ dword
		dd	 1.15999902e+04
		label	L811_TIER_B__hla_ dword
		dd	 4.71499883e+04
		label	L812_TIER_C__hla_ dword
		dd	 1.00524992e+05
		label	L813_TIER_D__hla_ dword
		dd	 1.91949984e+05
		label	L814_resultValue__hla_ byte
		db	00h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
