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
L809_sumIsPositive__hla_:
		mov	dword ptr [L812_iRegisterValue__hla_+0], ebx	;/* iRegisterValue */
		pop	dword ptr [L810_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	word ptr [L811_iTemporary__hla_+0]	;/* iTemporary */
		pop	word ptr [L811_iTemporary__hla_+0]	;/* iTemporary */
		mov	bx, word ptr [L811_iTemporary__hla_+0]	;/* iTemporary */
		mov	byte ptr [ebp+8], bl	;/* value3 */
		pop	word ptr [L811_iTemporary__hla_+0]	;/* iTemporary */
		mov	bx, word ptr [L811_iTemporary__hla_+0]	;/* iTemporary */
		mov	byte ptr [ebp+12], bl	;/* value2 */
		pop	word ptr [L811_iTemporary__hla_+0]	;/* iTemporary */
		mov	bx, word ptr [L811_iTemporary__hla_+0]	;/* iTemporary */
		mov	byte ptr [ebp+16], bl	;/* value1 */
		push	dword ptr [L810_iReturnAddress__hla_+0]	;/* iReturnAddress */
		push	dword ptr [L812_iRegisterValue__hla_+0]	;/* iRegisterValue */
		mov	al, byte ptr [ebp+16]	;/* value1 */
		mov	bl, byte ptr [ebp+12]	;/* value2 */
		add	bl, al
		mov	al, bl
		mov	bl, byte ptr [ebp+8]	;/* value3 */
		add	bl, al
		cmp	al, 0
		jg	L813_positive__hla_
		mov	dx, 0
		push	L827_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L832_done__hla_

L813_positive__hla_:
		mov	dx, 1
		push	L846_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln

L832_done__hla_:
		ret
xL809_sumIsPositive__hla___hla_:
;L809_sumIsPositive__hla_ endp




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


		push	L864_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L806_value1__hla_+0], al	;/* value1 */
		pop	eax
		push	L886_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L807_value2__hla_+0], al	;/* value2 */
		pop	eax
		push	L908_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L808_value3__hla_+0], al	;/* value3 */
		pop	eax
		mov	bx, 0
		mov	bl, byte ptr [L806_value1__hla_+0]	;/* value1 */
		push	bx
		mov	bx, 0
		mov	bl, byte ptr [L807_value2__hla_+0]	;/* value2 */
		push	bx
		mov	bx, 0
		mov	bl, byte ptr [L808_value3__hla_+0]	;/* value3 */
		push	bx
		mov	bx, 0
		push	bx
		call	L809_sumIsPositive__hla_
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


