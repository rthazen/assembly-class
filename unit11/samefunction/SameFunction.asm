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

		include	'SameFunction.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'SameFunction.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'SameFunction.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'SameFunction.consts.inc'

		include	'SameFunction.ro.inc'

; Code begins here:
L806_theSame__hla_:
		pop	edx
		pop	word ptr [ebp+8]	;/* z */
		pop	word ptr [ebp+12]	;/* y */
		pop	word ptr [ebp+16]	;/* x */
		pop	word ptr [ebp+20]	;/* w */
		push	edx
		mov	bx, word ptr [ebp+8]	;/* z */
		cmp	word ptr [ebp+12], bx	;/* y */
		jne	L807_ReturnZero__hla_
		mov	bx, word ptr [ebp+12]	;/* y */
		cmp	word ptr [ebp+16], bx	;/* x */
		jne	L807_ReturnZero__hla_
		mov	bx, word ptr [ebp+16]	;/* x */
		cmp	word ptr [ebp+20], bx	;/* w */
		jne	L807_ReturnZero__hla_
		mov	al, 1
		jmp	L808_ExitSequence__hla_

L807_ReturnZero__hla_:
		mov	al, 0

L808_ExitSequence__hla_:
		ret
xL806_theSame__hla___hla_:
;L806_theSame__hla_ endp




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


		push	L822_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDIN_GETI16	; geti16
		push	ax
		push	L836_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDIN_GETI16	; geti16
		push	ax
		push	L850_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDIN_GETI16	; geti16
		push	ax
		push	L864_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDIN_GETI16	; geti16
		push	ax
		call	L806_theSame__hla_
		cmp	al, 1
		jne	L865_NumbersAreDifferent__hla_
		push	L879_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L880_EndProgram__hla_

L865_NumbersAreDifferent__hla_:
		push	L894_str__hla_
		call	STDOUT_PUTS	; puts

L880_EndProgram__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


