		label	L806_finalAverage__hla_ dword
		rb	4
		label	L808_sum__hla_ dword
		dd	 0.00000000e+00
		label	L809_count__hla_ dword
		dd	00h
		label	L810_average__hla_ dword
		rb	4
		label	L811_dataPoint__hla_ dword
		rb	4
		label	L812_response__hla_ byte
		db	00h
		label	L813_no__hla_ byte
		db	06eh
		label	L814_yes__hla_ byte
		db	079h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
