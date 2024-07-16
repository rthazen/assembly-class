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

		include	'Nested.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'Nested.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'Nested.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'Nested.consts.inc'

		include	'Nested.ro.inc'

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


		push	L821_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L806_i__hla_+0], al	;/* i */
		pop	eax
		push	L843_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L807_j__hla_+0], al	;/* j */
		pop	eax

L852_ForLp__hla_:

L853_InitializeForLp__hla_:
		mov	bl, 1

L854_ForLpTerminationTest__hla_:
		cmp	bl, byte ptr [L806_i__hla_+0]	;/* i */
		jg	L855_ForLpDone__hla_

L856_ForLpBody__hla_:
		push	ebx
		call	STDOUT_PUTI8	; puti8
		call	STDOUT_NEWLN	; newln

L870_ForLp2__hla_:

L871_InitializeForLp2__hla_:
		mov	cl, byte ptr [L807_j__hla_+0]	;/* j */

L872_ForLpTerminationTest2__hla_:
		cmp	cl, 0
		jle	L873_ForLpDone2__hla_

L874_ForLpBody2__hla_:
		push	ecx
		call	STDOUT_PUTI8	; puti8
		push	L888_str__hla_
		call	STDOUT_PUTS	; puts

L889_ForLpIncrement2__hla_:
		dec	cl
		jmp	L872_ForLpTerminationTest2__hla_

L873_ForLpDone2__hla_:
		call	STDOUT_NEWLN	; newln

L903_ForLpIncrement__hla_:
		inc	bl
		jmp	L854_ForLpTerminationTest__hla_

L855_ForLpDone__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


