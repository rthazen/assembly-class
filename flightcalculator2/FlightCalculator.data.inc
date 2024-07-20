		label	L806_input__hla_ byte
		rb	1
		label	L807_totalCost__hla_ dword
		rb	4
		label	L808_miles__hla_ byte
		rb	1
		label	L809_bags__hla_ byte
		rb	1
		label	L810_meal__hla_ byte
		rb	1
		label	L811_firstClass__hla_ byte
		rb	1
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
