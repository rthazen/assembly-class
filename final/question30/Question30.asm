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

		include	'Question30.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'Question30.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'Question30.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'Question30.consts.inc'

		include	'Question30.ro.inc'

; Code begins here:
L809_makeThirtyIfOneIsZero__hla_:
		mov	dword ptr [L814_dEBXRegister__hla_+0], ebx	;/* dEBXRegister */
		mov	dword ptr [L813_dECXRegister__hla_+0], ecx	;/* dECXRegister */
		mov	dword ptr [L812_dEDXRegister__hla_+0], edx	;/* dEDXRegister */
		pop	dword ptr [L810_dReturnAddress__hla_+0]	;/* dReturnAddress */
		pop	ebx
		pop	ecx
		pop	edx
		push	dword ptr [L810_dReturnAddress__hla_+0]	;/* dReturnAddress */
		push	dword ptr [L812_dEDXRegister__hla_+0]	;/* dEDXRegister */
		push	dword ptr [L813_dECXRegister__hla_+0]	;/* dECXRegister */
		push	dword ptr [L814_dEBXRegister__hla_+0]	;/* dEBXRegister */
		push	word ptr [edx+0]	;/* [edx] */
		pop	word ptr [L811_iTemporary__hla_+0]	;/* iTemporary */
		cmp	word ptr [L811_iTemporary__hla_+0], 0	;/* iTemporary */
		je	L815_makeAllThirty__hla_
		push	word ptr [ecx+0]	;/* [ecx] */
		pop	word ptr [L811_iTemporary__hla_+0]	;/* iTemporary */
		cmp	word ptr [L811_iTemporary__hla_+0], 0	;/* iTemporary */
		je	L815_makeAllThirty__hla_
		push	word ptr [ebx+0]	;/* [ebx] */
		pop	word ptr [L811_iTemporary__hla_+0]	;/* iTemporary */
		cmp	word ptr [L811_iTemporary__hla_+0], 0	;/* iTemporary */
		je	L815_makeAllThirty__hla_
		jmp	L816_done__hla_

L815_makeAllThirty__hla_:
		mov	word ptr [L811_iTemporary__hla_+0], 30	;/* iTemporary */
		push	word ptr [L811_iTemporary__hla_+0]	;/* iTemporary */
		pop	word ptr [edx+0]	;/* [edx] */
		push	word ptr [L811_iTemporary__hla_+0]	;/* iTemporary */
		pop	word ptr [ecx+0]	;/* [ecx] */
		push	word ptr [L811_iTemporary__hla_+0]	;/* iTemporary */
		pop	word ptr [ebx+0]	;/* [ebx] */

L816_done__hla_:
		pop	ebx
		pop	ecx
		pop	edx
		ret
xL809_makeThirtyIfOneIsZero__hla___hla_:
;L809_makeThirtyIfOneIsZero__hla_ endp




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


		push	L830_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L806_iValue1__hla_+0], ax	;/* iValue1 */
		pop	eax
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L807_iValue2__hla_+0], ax	;/* iValue2 */
		pop	eax
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L808_iValue3__hla_+0], ax	;/* iValue3 */
		pop	eax
		mov	eax, L855_iValue1__hla_
		push	eax
		mov	eax, L856_iValue2__hla_
		push	eax
		mov	eax, L857_iValue3__hla_
		push	eax
		call	L809_makeThirtyIfOneIsZero__hla_
		push	L871_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L885_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L806_iValue1__hla_+0]	; (type int16 iValue1)
		call	STDOUT_PUTI16	; puti16
		push	L914_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L807_iValue2__hla_+0]	; (type int16 iValue2)
		call	STDOUT_PUTI16	; puti16
		push	L943_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L808_iValue3__hla_+0]	; (type int16 iValue3)
		call	STDOUT_PUTI16	; puti16
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


