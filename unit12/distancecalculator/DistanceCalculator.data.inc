		label	L806_x1__hla_ dword
		rb	4
		label	L807_x2__hla_ dword
		rb	4
		label	L808_y1__hla_ dword
		rb	4
		label	L809_y2__hla_ dword
		rb	4
		label	L811_returnAddress__hla_ dword
		rb	4
		label	L812_xSubValue__hla_ dword
		rb	4
		label	L813_ySubValue__hla_ dword
		rb	4
		label	L814_dist__hla_ dword
		rb	4
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
