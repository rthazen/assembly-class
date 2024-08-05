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

		include	'Question25.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'Question25.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'Question25.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'Question25.consts.inc'

		include	'Question25.ro.inc'

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


		push	L825_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L806_x__hla_+0]	;/* x */
		pop	eax
		push	L847_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L807_y__hla_+0]	;/* y */
		pop	eax
		finit
		fld	dword ptr [L806_x__hla_+0]	;/* x */
		fld	dword ptr [L806_x__hla_+0]	;/* x */
		fmulp
		fld	dword ptr [L806_x__hla_+0]	;/* x */
		fmulp
		fld	dword ptr [L808_five__hla_+0]	;/* five */
		fmulp
		fld	dword ptr [L807_y__hla_+0]	;/* y */
		fld	dword ptr [L807_y__hla_+0]	;/* y */
		fmulp
		fld	dword ptr [L809_sixPointOne__hla_+0]	;/* sixPointOne */
		fmulp
		fmulp
		fld	dword ptr [L810_sevenPointThree__hla_+0]	;/* sevenPointThree */
		fsubp
		fld	dword ptr [L806_x__hla_+0]	;/* x */
		fld	dword ptr [L807_y__hla_+0]	;/* y */
		fsubp
		fmulp
		fstp	dword ptr [L811_resultComputed__hla_+0]	;/* resultComputed */
		push	L869_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L811_resultComputed__hla_+0]	; resultComputed
		push	dword 0ah
		push	dword 04h
		call	STDOUT_PUTR32	; putr32
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


