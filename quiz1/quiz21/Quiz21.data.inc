		label	L806_xHold__hla_ dword
		rb	4
		label	L807_x__hla_ dword
		rb	4
		label	L808_y__hla_ dword
		rb	4
		label	L809_answer1__hla_ dword
		rb	4
		label	L810_answer2__hla_ dword
		rb	4
		label	L811_answer3__hla_ dword
		rb	4
		label	L812_answer4__hla_ dword
		rb	4
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
