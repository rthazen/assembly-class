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

		include	'RollingAverage.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'RollingAverage.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'RollingAverage.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'RollingAverage.consts.inc'

		include	'RollingAverage.ro.inc'

; Code begins here:
L807_recursiveProcedure__hla_:
		push	L828_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L811_dataPoint__hla_+0]	;/* dataPoint */
		pop	eax
		finit
		fld	dword ptr [L808_sum__hla_+0]	;/* sum */
		fld	dword ptr [L811_dataPoint__hla_+0]	;/* dataPoint */
		faddp
		fstp	dword ptr [L808_sum__hla_+0]	;/* sum */
		inc	dword ptr [L809_count__hla_+0]	;/* count */
		fld	dword ptr [L808_sum__hla_+0]	;/* sum */
		fild	dword ptr [L809_count__hla_+0]	;/* count */
		fdivp
		fstp	dword ptr [L810_average__hla_+0]	;/* average */
		push	L850_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L810_average__hla_+0]	; average
		push	dword 0ah
		push	dword 03h
		call	STDOUT_PUTR32	; putr32
		call	STDOUT_NEWLN	; newln
		push	L864_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDIN_FLUSHINPUT	; flushInput
		call	STDIN_GETC	; getc
		mov	byte ptr [L812_response__hla_+0], al	;/* response */
		cmp	al, byte ptr [L814_yes__hla_+0]	;/* yes */
		je	L865_keepGoing__hla_
		jmp	L866_endRecursiveLoop__hla_

L865_keepGoing__hla_:
		call	L807_recursiveProcedure__hla_

L866_endRecursiveLoop__hla_:
		fld	dword ptr [L810_average__hla_+0]	;/* average */
		fstp	dword ptr [L806_finalAverage__hla_+0]	;/* finalAverage */
		ret
xL807_recursiveProcedure__hla___hla_:
;L807_recursiveProcedure__hla_ endp




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


		call	L807_recursiveProcedure__hla_
		push	L880_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_finalAverage__hla_+0]	; finalAverage
		push	dword 0ah
		push	dword 03h
		call	STDOUT_PUTR32	; putr32
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


