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

		include	'ArrayMallocProgram.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'ArrayMallocProgram.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'ArrayMallocProgram.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'ArrayMallocProgram.consts.inc'

		include	'ArrayMallocProgram.ro.inc'

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
		push	L843_str__hla_
		call	STDOUT_PUTS	; puts
		push	ebx
		call	STDOUT_PUTB	; putb
		call	STDOUT_NEWLN	; newln
		mul	bl
		push	L867_str__hla_
		call	STDOUT_PUTS	; puts
		push	ebx
		call	STDOUT_PUTB	; putb
		call	STDOUT_NEWLN	; newln
		mov	ebx, 0
		mov	bx, ax
		push	L891_str__hla_
		call	STDOUT_PUTS	; puts
		push	ebx
		call	STDOUT_PUTD	; putd
		call	STDOUT_NEWLN	; newln
		push	ebx
		call	MEM_ALLOC	; malloc
		mov	dword ptr [L807_dArrayBaseAddress__hla_+0], eax	;/* dArrayBaseAddress */
		push	L915_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_dArrayBaseAddress__hla_+0]	; (type dword dArrayBaseAddress)
		call	STDOUT_PUTD	; putd
		call	STDOUT_NEWLN	; newln
		push	L939_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_dArrayBaseAddress__hla_+0]	; (type dword dArrayBaseAddress)
		call	STDOUT_PUTD	; putd
		call	STDOUT_NEWLN	; newln
		push	L963_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_dArrayBaseAddress__hla_+0]	; (type dword dArrayBaseAddress)
		call	STDOUT_PUTD	; putd
		call	STDOUT_NEWLN	; newln

L974_ForLoop__hla_:

L975_ForLoopInit__hla_:
		mov	dl, 0
		mov	ebx, eax

L976_ForLoopTerminationClause__hla_:
		cmp	dl, byte ptr [L806_iSize__hla_+0]	;/* iSize */
		jge	L977_ForLoopEnd__hla_

L978_ForLoopBody__hla_:
		mov	[ebx+0], dl	;/* [ebx] */

L979_ForLoopIncrement__hla_:
		inc	dl
		inc	ebx
		jmp	L976_ForLoopTerminationClause__hla_

L977_ForLoopEnd__hla_:
		push	L993_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln

L998_PrintLoop__hla_:

L999_PrintLoopInit__hla_:
		mov	dl, 0
		mov	ebx, eax

L1000_PrintLoopTerminationClause__hla_:
		cmp	dl, byte ptr [L806_iSize__hla_+0]	;/* iSize */
		jge	L1001_PrintLoopEnd__hla_

L1002_PrintLoopBody__hla_:
		push	L1016_str__hla_
		call	STDOUT_PUTS	; puts
		push	edx
		call	STDOUT_PUTI8	; puti8
		push	L1030_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [ebx+0]	; [ebx]
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		call	STDOUT_NEWLN	; newln

L1031_PrintLoopIncrement__hla_:
		inc	dl
		inc	ebx
		jmp	L1000_PrintLoopTerminationClause__hla_

L1001_PrintLoopEnd__hla_:
		push	dword ptr [L807_dArrayBaseAddress__hla_+0]	; dArrayBaseAddress
		call	MEM_FREE	; free
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


