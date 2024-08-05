		label	L806_radius__hla_ dword
		rb	4
		label	L807_height__hla_ dword
		rb	4
		label	L809_returnAddress__hla_ dword
		rb	4
		label	L810_surfaceAreaSphere__hla_ dword
		rb	4
		label	L811_surfaceAreaCube__hla_ dword
		rb	4
		label	L812_surfaceAreaCylinder__hla_ dword
		rb	4
		label	L813_two__hla_ dword
		dd	 2.00000000e+00
		label	L814_four__hla_ dword
		dd	 4.00000000e+00
		label	L815_six__hla_ dword
		dd	 6.00000000e+00
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
