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

		include	'MallocProgram.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'MallocProgram.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'MallocProgram.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'MallocProgram.consts.inc'

		include	'MallocProgram.ro.inc'

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
		mov	byte ptr [L806_iValue__hla_+0], al	;/* iValue */
		pop	eax
		push	dword 01h
		call	MEM_ALLOC	; malloc
		mov	dword ptr [L807_dMallocAddress__hla_+0], eax	;/* dMallocAddress */
		mov	al, byte ptr [L806_iValue__hla_+0]	;/* iValue */
		mov	ebx, dword ptr [L807_dMallocAddress__hla_+0]	;/* dMallocAddress */
		mov	[ebx+0], al	;/* [ebx] */
		mov	al, [ebx+0]	;/* [ebx] */
		inc	al
		mov	[ebx+0], al	;/* [ebx] */
		mov	al, [ebx+0]	;/* [ebx] */
		mov	byte ptr [L806_iValue__hla_+0], al	;/* iValue */
		push	dword ptr [L807_dMallocAddress__hla_+0]	; dMallocAddress
		call	MEM_FREE	; free
		push	L843_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_iValue__hla_+0]	; (type int8 iValue)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


