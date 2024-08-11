; Assembly code emitted by HLA compiler
; Version 1.76 build 9932 (prototype)
; HLA compiler written by Randall Hyde
; FASM compatible output

		format	MS COFF


offset32	equ	 
ptr	equ	 

macro global [symbol]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol
   isextrn = 1
 end if
}

macro global2 [symbol,type]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol:type
   isextrn = 1
 end if
}


ExceptionPtr__hla_	equ	fs:0

		include	'SmallestValue.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'SmallestValue.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'SmallestValue.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'SmallestValue.consts.inc'

		include	'SmallestValue.ro.inc'

; Code begins here:
L809_smallest__hla_:
		mov	dword ptr [L815_dEBXRegister__hla_+0], ebx	;/* dEBXRegister */
		mov	dword ptr [L814_dECXRegister__hla_+0], ecx	;/* dECXRegister */
		mov	dword ptr [L813_dEDXRegister__hla_+0], edx	;/* dEDXRegister */
		pop	dword ptr [L810_dReturnAddress__hla_+0]	;/* dReturnAddress */
		pop	ebx
		pop	ecx
		pop	edx
		push	dword ptr [L810_dReturnAddress__hla_+0]	;/* dReturnAddress */
		push	dword ptr [L813_dEDXRegister__hla_+0]	;/* dEDXRegister */
		push	dword ptr [L814_dECXRegister__hla_+0]	;/* dECXRegister */
		push	dword ptr [L815_dEBXRegister__hla_+0]	;/* dEBXRegister */
		mov	dx, [edx+0]	;/* [edx] */
		mov	cx, [ecx+0]	;/* [ecx] */
		mov	bx, [ebx+0]	;/* [ebx] */
		mov	word ptr [L812_smallestValue__hla_+0], dx	;/* smallestValue */
		cmp	word ptr [L812_smallestValue__hla_+0], cx	;/* smallestValue */
		jle	L816_xIsLess__hla_
		mov	word ptr [L812_smallestValue__hla_+0], cx	;/* smallestValue */

L817_yIsLess__hla_:
		cmp	word ptr [L812_smallestValue__hla_+0], bx	;/* smallestValue */
		jle	L818_makeAllSmallest__hla_
		mov	word ptr [L812_smallestValue__hla_+0], bx	;/* smallestValue */
		jmp	L818_makeAllSmallest__hla_

L816_xIsLess__hla_:
		cmp	word ptr [L812_smallestValue__hla_+0], bx	;/* smallestValue */
		jle	L818_makeAllSmallest__hla_
		mov	word ptr [L812_smallestValue__hla_+0], bx	;/* smallestValue */

L818_makeAllSmallest__hla_:
		push	word ptr [L812_smallestValue__hla_+0]	;/* smallestValue */
		pop	word ptr [L806_iValue1__hla_+0]	;/* iValue1 */
		push	word ptr [L812_smallestValue__hla_+0]	;/* smallestValue */
		pop	word ptr [L807_iValue2__hla_+0]	;/* iValue2 */
		push	word ptr [L812_smallestValue__hla_+0]	;/* smallestValue */
		pop	word ptr [L808_iValue3__hla_+0]	;/* iValue3 */

L819_done__hla_:
		pop	ebx
		pop	ecx
		pop	edx
		ret
xL809_smallest__hla___hla_:
;L809_smallest__hla_ endp




;/* HWexcept__hla_ gets called when Windows raises the exception. */

HWexcept__hla_ :
		jmp	HardwareException__hla_
;HWexcept__hla_  endp

DfltExHndlr__hla_:
		jmp	DefaultExceptionHandler__hla_
;DfltExHndlr__hla_ endp



_HLAMain       :


;/* Set up the Structured Exception Handler record */
;/* for this program. */

		call	BuildExcepts__hla_
		pushd	0		;/* No Dynamic Link. */
		mov	ebp, esp	;/* Pointer to Main's locals */
		push	ebp		;/* Main's display. */


		push	L833_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L806_iValue1__hla_+0], ax	;/* iValue1 */
		pop	eax
		push	L855_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L807_iValue2__hla_+0], ax	;/* iValue2 */
		pop	eax
		push	L877_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L808_iValue3__hla_+0], ax	;/* iValue3 */
		pop	eax
		mov	eax, L886_iValue1__hla_
		push	eax
		mov	eax, L887_iValue2__hla_
		push	eax
		mov	eax, L888_iValue3__hla_
		push	eax
		call	L809_smallest__hla_
		push	L902_str__hla_
		call	STDOUT_PUTS	; puts
		push	L916_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L806_iValue1__hla_+0]	; (type int16 iValue1)
		call	STDOUT_PUTI16	; puti16
		push	L945_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L807_iValue2__hla_+0]	; (type int16 iValue2)
		call	STDOUT_PUTI16	; puti16
		push	L974_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L808_iValue3__hla_+0]	; (type int16 iValue3)
		call	STDOUT_PUTI16	; puti16
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


