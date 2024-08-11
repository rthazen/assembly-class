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

		include	'StringProgram.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'StringProgram.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'StringProgram.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'StringProgram.consts.inc'

		include	'StringProgram.ro.inc'

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
		mov	byte ptr [L806_iSize__hla_+0], al	;/* iSize */
		pop	eax
		mov	al, 1
		mov	bl, byte ptr [L806_iSize__hla_+0]	;/* iSize */
		inc	bl
		mul	bl
		mov	ebx, 0
		mov	bx, ax
		push	ebx
		call	MEM_ALLOC	; malloc
		mov	dword ptr [L807_dStringAddress__hla_+0], eax	;/* dStringAddress */

L830_ForLoop__hla_:

L831_ForLoopInit__hla_:
		mov	dl, 0
		mov	dh, 65
		mov	ebx, eax

L832_ForLoopTerminationClause__hla_:
		cmp	dl, byte ptr [L806_iSize__hla_+0]	;/* iSize */
		jge	L833_ForLoopEnd__hla_

L834_ForLoopBody__hla_:
		mov	[ebx+0], dh	;/* [ebx] */

L835_ForLoopIncrement__hla_:
		inc	dl
		inc	dh
		inc	ebx
		jmp	L832_ForLoopTerminationClause__hla_

L833_ForLoopEnd__hla_:
		mov	dh, 0
		mov	[ebx+0], dh	;/* [ebx] */

L836_PrintLoop__hla_:

L837_PrintLoopInit__hla_:
		mov	dh, 0
		mov	dl, 0
		mov	ebx, eax

L838_PrintLoopTerminationClause__hla_:
		cmp	[ebx+0], dh	;/* [ebx] */
		je	L839_PrintLoopEnd__hla_

L840_PrintLoopBody__hla_:
		push	L854_str__hla_
		call	STDOUT_PUTS	; puts
		push	edx
		call	STDOUT_PUTI8	; puti8
		push	L868_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [ebx+0]	; [ebx]
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTC	; putc
		call	STDOUT_NEWLN	; newln

L869_PrintLoopIncrement__hla_:
		inc	dl
		inc	ebx
		jmp	L838_PrintLoopTerminationClause__hla_

L839_PrintLoopEnd__hla_:
		push	dword ptr [L807_dStringAddress__hla_+0]	; dStringAddress
		call	MEM_FREE	; free
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


