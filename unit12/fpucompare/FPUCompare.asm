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

		include	'FPUCompare.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'FPUCompare.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'FPUCompare.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'FPUCompare.consts.inc'

		include	'FPUCompare.ro.inc'

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
		call	STDIN_GETF	; getf
		fstp	dword ptr [L806_x__hla_+0]	;/* x */
		pop	eax
		push	L843_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L807_y__hla_+0]	;/* y */
		pop	eax
		finit
		fld	dword ptr [L806_x__hla_+0]	;/* x */
		fld	dword ptr [L807_y__hla_+0]	;/* y */
		fcomp
		fstsw	ax
		sahf
		setb	al
		cmp	al, 1
		je	L852_yes__hla_
		jmp	L853_no__hla_

L852_yes__hla_:
		push	L867_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L872_theend__hla_

L853_no__hla_:
		push	L886_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln

L872_theend__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


