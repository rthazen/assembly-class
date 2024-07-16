		label	L806_matchNumber__hla_ dword
		rb	4
		label	L807_userInput__hla_ dword
		rb	4
		label	L808_positiveCount__hla_ dword
		dd	00h
		label	L809_negativeCount__hla_ dword
		dd	00h
		label	L810_maxPositiveStreak__hla_ dword
		dd	00h
		label	L811_maxNegativeStreak__hla_ dword
		dd	00h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
