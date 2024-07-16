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

		include	'RealBigNumber.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'RealBigNumber.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'RealBigNumber.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'RealBigNumber.consts.inc'

		include	'RealBigNumber.ro.inc'

; Code begins here:



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


		push	L820_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L806_n__hla_+0], al	;/* n */
		mov	bl, byte ptr [L806_n__hla_+0]	;/* n */
		push	L834_str__hla_
		call	STDOUT_PUTS	; puts

L835_start_outer_loop__hla_:
		cmp	byte ptr [L806_n__hla_+0], 0	;/* n */
		je	L836_end_program__hla_
		mov	al, 1

L837_start_inner_loop__hla_:
		push	eax
		call	STDOUT_PUTI8	; puti8
		cmp	al, byte ptr [L806_n__hla_+0]	;/* n */
		je	L838_end_inner_loop__hla_
		inc	al
		jmp	L837_start_inner_loop__hla_

L838_end_inner_loop__hla_:
		dec	byte ptr [L806_n__hla_+0]	;/* n */
		jmp	L835_start_outer_loop__hla_

L836_end_program__hla_:
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


