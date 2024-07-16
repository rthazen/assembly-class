		label	L806_userInput__hla_ byte
		rb	1
		label	L807_totalFees__hla_ dword
		dd	00h
		label	L808_milesFlown__hla_ byte
		rb	1
		label	L809_numBags__hla_ byte
		rb	1
		label	L810_mealPurchased__hla_ byte
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
