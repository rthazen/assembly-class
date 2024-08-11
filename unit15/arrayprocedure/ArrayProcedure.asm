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

		include	'ArrayProcedure.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'ArrayProcedure.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'ArrayProcedure.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'ArrayProcedure.consts.inc'

		include	'ArrayProcedure.ro.inc'

; Code begins here:
L808_printArray__hla_:
		mov	dword ptr [L812_dEBXRegister__hla_+0], ebx	;/* dEBXRegister */
		mov	word ptr [L811_dDXRegister__hla_+0], dx	;/* dDXRegister */
		pop	dword ptr [L809_dReturnAddress__hla_+0]	;/* dReturnAddress */
		pop	dx
		pop	dx
		mov	byte ptr [ebp+8], dl	;/* arraySize */
		pop	ebx
		push	dword ptr [L809_dReturnAddress__hla_+0]	;/* dReturnAddress */
		push	word ptr [L811_dDXRegister__hla_+0]	;/* dDXRegister */
		push	dword ptr [L812_dEBXRegister__hla_+0]	;/* dEBXRegister */

L813_PrintLoop__hla_:

L814_PrintLoopInit__hla_:
		mov	dl, 0

L815_PrintLoopTerminationClause__hla_:
		cmp	dl, byte ptr [ebp+8]	;/* arraySize */
		jge	L816_PrintLoopEnd__hla_

L817_PrintLoopBody__hla_:
		push	L831_str__hla_
		call	STDOUT_PUTS	; puts
		push	edx
		call	STDOUT_PUTI8	; puti8
		push	L845_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [ebx+0]	; [ebx]
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		call	STDOUT_NEWLN	; newln

L846_PrintLoopIncrement__hla_:
		inc	dl
		inc	ebx
		jmp	L815_PrintLoopTerminationClause__hla_

L816_PrintLoopEnd__hla_:
		pop	ebx
		pop	dx
		ret
xL808_printArray__hla___hla_:
;L808_printArray__hla_ endp




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


		push	L860_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L806_iSize__hla_+0], al	;/* iSize */
		pop	eax
		mov	al, 1
		mov	bl, byte ptr [L806_iSize__hla_+0]	;/* iSize */
		mul	bl
		mov	ebx, 0
		mov	bx, ax
		push	ebx
		call	MEM_ALLOC	; malloc
		mov	dword ptr [L807_dArrayBaseAddress__hla_+0], eax	;/* dArrayBaseAddress */

L869_ForLoop__hla_:

L870_ForLoopInit__hla_:
		mov	dl, 0
		mov	ebx, eax

L871_ForLoopTerminationClause__hla_:
		cmp	dl, byte ptr [L806_iSize__hla_+0]	;/* iSize */
		jge	L872_ForLoopEnd__hla_

L873_ForLoopBody__hla_:
		mov	[ebx+0], dl	;/* [ebx] */

L874_ForLoopIncrement__hla_:
		inc	dl
		inc	ebx
		jmp	L871_ForLoopTerminationClause__hla_

L872_ForLoopEnd__hla_:
		push	L888_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	dword ptr [L807_dArrayBaseAddress__hla_+0]	;/* dArrayBaseAddress */
		mov	ecx, 0
		mov	cl, byte ptr [L806_iSize__hla_+0]	;/* iSize */
		push	cx
		push	cx
		call	L808_printArray__hla_
		push	dword ptr [L807_dArrayBaseAddress__hla_+0]	; dArrayBaseAddress
		call	MEM_FREE	; free
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


